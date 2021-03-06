import 'package:flutter/material.dart';
import '/widgets/Appbar.dart';
import '/widgets/TagMenu.dart';
import 'ProductList.dart';

class ProductPage extends StatefulWidget {
  final int index;
  ProductPage(this.index);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: MyAppbar()),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
            ),
          ],
        ),
          child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'หน้าแรก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'โปรโมชัน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'แจ้งเตือน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'บัญชี',
            ),
          ],
          currentIndex: _selectedIndex, // Bottom Navbar Item Highlight

          selectedItemColor: Colors.teal,
          onTap: _onItemTapped,
      ),
        ),
      body: Column(
        children: [
          TagMenu(widget.index),
          SizedBox(height: 15,),
          WebScraperApp(widget.index),
        ],
      )
    );
  }
}
