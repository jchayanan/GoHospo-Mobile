import 'package:flutter/material.dart';

class FadeEndListview extends StatelessWidget {
  const FadeEndListview({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      width: 8.0,
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            stops: [0.0, 1.0],
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
            ],
          ),
        ),
      ),
    );
  }
}
