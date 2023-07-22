import 'package:dokon/presintation/ui/resourses/styles/Provider.dart';
import 'package:dokon/presintation/ui/screens/body/start_screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Providers();
      },
      builder: (context, child) {
        final provider = Provider.of<Providers>(context);
        return MaterialApp(
          theme: provider.themeMode,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}
