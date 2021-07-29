import 'package:flutter/material.dart';
import 'package:gohospo/screens/HomePage.dart';
import '/widgets/Appbar.dart';
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
        bottomNavigationBar: BottomNavigationBar(
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
      body: WebScraperApp(widget.index)
    );
  }
}
