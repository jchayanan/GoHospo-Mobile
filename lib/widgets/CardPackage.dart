import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';

class CardPackage extends StatelessWidget {
  final String title;
  final double price;

  CardPackage({required this.title, required this.price});
  final numDisplay = createDisplay(length: 8, decimal: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 200,
      child: Card(
        color: Colors.white,
        elevation: 2,
        child: Column(
          children: [
            Image.asset('assets/images/recommended.jpg'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(fontSize: 9),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(numDisplay(price), style: TextStyle(fontSize: 12)),
                Text(" บาท", style: TextStyle(fontSize: 12))],
              ),
            )],
        ),
      ),
    );
  }
}
