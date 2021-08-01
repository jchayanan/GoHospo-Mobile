import 'package:flutter/material.dart';

class TagMenu extends StatelessWidget {
  final int index;
  TagMenu(this.index);

  final List<String> headAndneck = ['หัว','ตา','หู','จมูก','ช่องปาก','ลำคอ','ผม'];
  final List<String> upperParts = ['หลัง','ไหล่','ปอด','กล้ามเนื้อ'];
  final List<String> lowerParts = ['หัวเข่า','ขา'];
  final List<String> healthCheck = ['ตรวจสุขภาพ','ตรวจสุขภาพก่อนแต่ง','วัคซีน'];
  final List<String> beauty = ['โบท็อก','หน้า','ฟิลเลอร์','กลูตา'];
  final List<String> nursingHome = ['ที่จอดรถ','รถวีลแชร์'];
  final List<String> covid19Package = [];
  final List<String> healthProducts = [];
  final List<String> onlyForGohospo = [];

  
  
  @override
  Widget build(BuildContext context) {

    final Map<int, List<String>> listOftag = {
      0:headAndneck,
      1:upperParts,
      2:lowerParts,
      3:healthCheck,
      4:beauty,
      5:nursingHome,
      6:covid19Package,
      7:healthProducts,
      8:onlyForGohospo,};

    return  Container(
      child: listOftag[index]!.length == 0 ? null : Ink(
        width: MediaQuery.of(context).size.width * 0.90,
        height: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, top: 25.0, right: 12),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
              childAspectRatio: 10/9,
              mainAxisSpacing: 4,       
            crossAxisCount: 5),
            itemCount: listOftag[index]!.length,
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
                image: AssetImage('assets/images/icon/healthproduct.png'),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: (){ 
                  },
                  splashColor: Colors.teal,
                ),
                ),
              ),
            ),
          
          Expanded(
              child: Text('tag name',
                  style: TextStyle(color: Colors.teal, fontSize: 9))),
        ],
      );
                }),
          )),
    );
  }
}