import 'package:flutter/material.dart';

class WCategoyr extends StatefulWidget {
  final String title;
  final String image;
  const WCategoyr({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  State<WCategoyr> createState() => _WCategoyrState();
}

class _WCategoyrState extends State<WCategoyr> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                shape: BoxShape.circle),
            child: Image.asset(widget.image),
          ),
          const SizedBox(height: 10),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
