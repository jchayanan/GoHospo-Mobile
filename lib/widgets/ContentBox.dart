import 'package:flutter/material.dart';

class ContentBox extends StatelessWidget {
  const ContentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.teal,
            width: 2,
          ),
        ));
  }
}