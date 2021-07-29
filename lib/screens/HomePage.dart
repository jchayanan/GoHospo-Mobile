import 'package:flutter/material.dart';
import 'package:gohospo/screens/LoginPage.dart';
import 'package:gohospo/screens/ProductPage.dart';
import 'package:gohospo/widgets/CardBanner.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/widgets/CardPackage.dart';
import '/widgets/Appbar.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'LoginPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

TextEditingController appBarSearchController = TextEditingController();

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    Home(),
    Home(),
    Home(),
    Home(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: _children[_selectedIndex],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
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
    ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              left: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileIcon(),
              ],
            ),
          ),
          SizedBox(height: 10),
          HeroMenu(),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeCarouselSlider(),
              SizedBox(height: 20),
              RecommendedPackage(),
            ],
          ),
        ],
      ),
    );
  }
}

class ExtraPointBox extends StatelessWidget {
  const ExtraPointBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.teal,
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.star_rounded, size: 30, color: Colors.yellow.shade700),
            Text("700",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(
              "Point",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.teal.shade700,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

///////////////// End Extrapoint Box //////////////////////////////////////////////////

//////////////////// Profile //////////////////////////

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RowSuper(
      innerDistance: -11,
      invert: true,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: new Border.all(
              color: Colors.teal,
              width: 3.0,
            ),
          ),
          child: CircleAvatar(
            radius: 30,
            child: ClipRRect(
              child: Image.asset('assets/images/avatar2.png'),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        Greeting(),
      ],
    );
  }
}

/////////////////// End Profile ///////////////////////////

////////////////// Greeting ///////////////////////////////

class Greeting extends StatelessWidget {
  const Greeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      width: 160,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: TextButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left:5.0),
                  child: Text("เข้าสู่ระบบ/สมัครสมาชิก",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                )),
          )
        ],
      ),
    );
  }
}

////////////////// End Greeting ///////////////////////////

//////////////////////// Home Carousel /////////////////////////

final List<Widget> cardBanner = [
  CardBanner(title: 'โปรแกรมตรวจ DNA พรีเมียม วิเคราะห์ความเสี่ยงในการเกิดโรคมะเร็ง'),
  CardBanner(title: 'โปรแกรมตรวจ DNA พรีเมียม (Premium DNA) วิเคราะห์ความเสี่ยงในการเกิดโรคมะเร็ง'),
  CardBanner(title: 'โปรแกรมตรวจ DNA พรีเมียม (Premium DNA) วิเคราะห์ความเสี่ยงในการเกิดโรคมะเร็ง'),
  CardBanner(title: 'โปรแกรมตรวจ DNA พรีเมียม (Premium DNA) วิเคราะห์ความเสี่ยงในการเกิดโรคมะเร็ง'),
  CardBanner(title: 'โปรแกรมตรวจ DNA พรีเมียม (Premium DNA) วิเคราะห์ความเสี่ยงในการเกิดโรคมะเร็ง'),
];

class HomeCarouselSlider extends StatefulWidget {
  @override
  _HomeCarouselSliderState createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
              items: cardBanner,
              carouselController: _controller,
              options: CarouselOptions(
                height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: cardBanner.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 5.0,
              height: 5.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.blue)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
      ],
    );
  }
}

//////////////////// End Home Carousel //////////////////////

/////////////////// Carousel indicator ////////////////////

var carouselIndicator =
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  Padding(
    padding: const EdgeInsets.only(left: 7),
    child: Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
    ),
  )
]);

var bluecarouselIndicator =
    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  Padding(
    padding: const EdgeInsets.only(left: 7),
    child: Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
    ),
  )
]);

/////////////////// End Carousel indicator ////////////////////

////////////////// Hero Menu ///////////////////////////
class HeroMenu extends StatefulWidget {

  @override
  _HeroMenuState createState() => _HeroMenuState();
}

class _HeroMenuState extends State<HeroMenu> {

  final List<String> heromenuName=[
    "ศีรษะและลำคอ",
    "ส่วนบน",
    "ส่วนล่าง",
    "ตรวจสุขภาพ",
    "ความงามและสปา",
    "ดูแลผู้สูงอายุ",
    "แพ็คเกจโควิด",
    "สินค้าเพื่อสุขภาพ",
    "ดีลพิเศษ",
    "อื่น ๆ"];

  final List<String> heromenuImg=[
    "assets/images/icon/headandneck.png",
    "assets/images/icon/upper.png",
    "assets/images/icon/lower.png",
    "assets/images/icon/healthcheck.png",
    "assets/images/icon/beauty.png",
    "assets/images/icon/nursinghome.png",
    "assets/images/icon/covid.jpg",
    "assets/images/icon/healthproduct.png",
    "assets/images/icon/onlygohospo.jpg",
    ];

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: MediaQuery.of(context).size.width * 0.90,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, top: 25.0, right: 12),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
            childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.7),   
          mainAxisSpacing:10,     
          crossAxisCount: 5),
          itemCount: heromenuName.length-1,
              physics: new NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.teal.shade400,
              width: 1,
            )
          ),
          child: Material(
            shape: CircleBorder(),
            clipBehavior: Clip.hardEdge,
            color: Colors.transparent,
            child: Ink.image(
              image: AssetImage(heromenuImg[index]),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              child: InkWell(
                onTap: (){print(index);  
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(index)));             
                },
                splashColor: Colors.teal,
              ),
              ),
            ),
          ),
        
        Expanded(
            child: Text(heromenuName[index],
                style: TextStyle(color: Colors.teal, fontSize: 9))),
      ],
    );
              }),
        ));
  }
}

/////////////////// End Hero Menu //////////////////////////

////////////////// Search Box ///////////////////////////

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ColumnSuper(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              color: Colors.teal.shade600),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          BorderSide(width: 0, style: BorderStyle.none)),
                  hintText: 'ค้นหาโรค, โรงพยาบาล หรือ คลินิก',
                  hintStyle: TextStyle(
                    letterSpacing: 1,
                    fontSize: 12,
                    color: Colors.black26,
                  ),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(10),
                ),
                autofocus: false),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(10.0)),
              color: Colors.teal.shade400),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        print(searchController.text);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                      side: BorderSide(color: Colors.white)))),
                      child: Text(
                        "ค้นหา",
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

///////////////// End Search Box ////////////////////////

/////////////////// Recommended Package ///////////////

class RecommendedPackage extends StatelessWidget {
  const RecommendedPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("แพ็คเกจแนะนำ",
                      style:
                          TextStyle(fontSize: 20, color: Colors.teal.shade400)),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 5),
                          child: CardPackage(title: "บริการตรวจเชื้อโควิด", price: 2100)),
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child:
                              CardPackage(title: "ตรวจหาเชื้อ Covid ด้วยวิธี RT PCR", price: 1500)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: CardPackage(title: "lorem ipsum Nostrud deserunt ut reprehenderit consectetur nulla nostrud ex cupidatat consectetur ipsum.", price: 12000),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CardPackage(title: "lorem ipsum Qui aliquip elit ut culpa sunt ea est enim ex reprehenderit velit anim excepteur ipsum.", price: 18000)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 20),
                        child: CardPackage(title: "lorem ipsum Minim sit excepteur ex ipsum quis labore id qui deserunt ad proident fugiat Lorem.", price: 9999),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }
}

