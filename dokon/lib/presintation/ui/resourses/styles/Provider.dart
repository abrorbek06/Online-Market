import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum PaymeState { card, otp, success }

class Providers extends ChangeNotifier {
  var _themeMode = ThemeData.light();
  ThemeData get themeMode => _themeMode;

  changeTheme() {
    final isDark = _themeMode == ThemeData.dark();
    if (isDark) {
      _themeMode = ThemeData.light();
    } else {
      _themeMode = ThemeData.dark();
    }
    notifyListeners();
  }

  late String cardNumber;
  late String expire;
  late String code;

  final _url = Uri.https('checkout.test.paycom.uz', 'api');

  final String _xAuth = "5e730e8e0b852a417aa49ceb";
  final String _paymentAuth =
      "5e730e8e0b852a417aa49ceb:ZPDODSiTYKuX0jyO7Kl2to4rQbNwG08jbghj";

  String token = "";

  String message = "";

  List<String> errors = [];

  PaymeState paymeState = PaymeState.card;

  void send({required String cardNumber, required String expire}) async {
    paymeState = PaymeState.card;
    this.cardNumber = cardNumber;
    this.expire = expire;
    if (validate()) {
      final params = {
        "card": {
          "number": cardNumber,
          "expire": expire,
        },
        'save': true,
      };

      final Map<String, dynamic> cardResponse =
          await getResponse(method: "cards.create", data: params);

      if (cardResponse.containsKey('result')) {
        token = cardResponse['result']['card']['token'];

        final params = {
          "token": token,
        };

        final Map<String, dynamic> verifyResponse =
            await getResponse(method: 'cards.get_verify_code', data: params);

        if (verifyResponse.containsKey('result')) {
          message =
              "${verifyResponse['result']['phone']} raqamiga sms yuborildi";
          paymeState = PaymeState.otp;
        } else {
          showErrors(verifyResponse["error"]['message']);
        }
      } else {
        showErrors(cardResponse["error"]['message']);
      }
    }
    notifyListeners();
  }

  String payToken = "";

  void sendOtp({required String code}) async {
    if (code.isEmpty) {
      errors.add("SMS kodni kiritish majburiy");
      notifyListeners();
    } else {
      final params = {
        'token': token,
        'code': code,
      };

      final Map<String, dynamic> verifyResponse =
          await getResponse(method: "cards.verify", data: params);

      if (verifyResponse.containsKey('result')) {
        payToken = verifyResponse['result']['card']['token'];
        pay();
      } else {
        showErrors(verifyResponse["error"]['message']);
        notifyListeners();
      }
    }
  }

  void pay() async {
    final params = {'amount': 10000 * 100};
    final Map<String, dynamic> payResponse = await getResponse(
        method: "receipts.create", data: params, xAuth: _paymentAuth);

    if (payResponse.containsKey('result')) {
      final id = payResponse['result']["receipt"]['_id'];

      final params = {
        "id": id,
        "token": payToken,
      };

      final Map<String, dynamic> finalResponse = await getResponse(
          method: 'receipts.pay', data: params, xAuth: _paymentAuth);

      if (finalResponse.containsKey('result')) {
        message = "To'landi";
        paymeState = PaymeState.success;
        notifyListeners();
      } else {
        showErrors(finalResponse["error"]['message']);
      }
    } else {
      showErrors(payResponse["error"]['message']);
    }
  }

  showErrors(String text) {
    errors.clear();
    errors.add(text);
  }

  bool validate() {
    errors.clear();
    if (cardNumber.length != 16) {
      errors.add("Karta raqamini to'g'ri yozing");
    }
    if (expire.length != 4) {
      errors.add("Codeni to'g'ri yozing");
    }
    return errors.isEmpty;
  }

  getResponse(
      {required String method,
      required Map<String, dynamic> data,
      String? xAuth}) async {
    final params = {
      "method": method,
      "params": data,
    };
    var response = await http.post(
      _url,
      body: json.encode(params),
      headers: {
        "X-Auth": xAuth ?? _xAuth,
      },
    );

    print(response.body);
    return json.decode(response.body) as Map<String, dynamic>;
  }
}
