import 'package:flutter/material.dart';

class CardBanner extends StatelessWidget {
  final String title;

  CardBanner({this.title=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.87,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 7, 5),
            child: Container(
              height: double.maxFinite,
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/cardbanner.jpg',
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 4, right: 12),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Text("เพิ่มเติม",style: TextStyle(color: Colors.white, fontSize: 12))),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 20,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  )),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Color(0xFFFFFFFF)),
                                ),
                                child: Text("คลิก", style: TextStyle(color: Colors.teal),),
                                onPressed: () {},
                              ),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
