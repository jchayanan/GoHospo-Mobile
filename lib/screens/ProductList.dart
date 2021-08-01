import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';

class WebScraperApp extends StatefulWidget {
  final int index;
  WebScraperApp(this.index);

  @override
  _WebScraperAppState createState() => _WebScraperAppState();
}

class _WebScraperAppState extends State<WebScraperApp> {

  final List<String> linkDestination = [
    '/tha/thailand-head_and_nack.html',
    '/tha/thailand-upper_parts.html',
    '/tha/thailand-lower_parts.html',
    '/tha/thailand-health_check_up.html',
    '/tha/thailand-beauty_and_spa.html',
    '/tha/thailand-nursing_home.html',
    '/tha/thailand-covid19_package.html',
    '/tha/thailand-health_products.html',
    '/tha/thailand-only_for_gohospo.html'];

  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('https://www.go-hospo.com');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>>? productNames;
  List<Map<String, dynamic>>? productDescriptions;
  List<Map<String, dynamic>>? productPrice;
  List<Map<String, dynamic>>? productImage;
  List<Map<String, dynamic>>? productRating;
  List<Map<String, dynamic>>? productLink;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage(linkDestination[widget.index])) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        productNames = webScraper.getElement('.card-title > a', ['']);
        productDescriptions =
            webScraper.getElement('p.card-sub-title > a', ['']);
        productPrice =
            webScraper.getElement('div.price > div.price-sell', ['']);
        productImage =
            webScraper.getElement('div.card-pic > img', ['data-src']);
        productRating =
            webScraper.getElement('div.card-point-right > div.point-number', ['']);
        productLink =
            webScraper.getElement('div.card-action > a', ['href']);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    print(productPrice);
    print('................');
    print(productPrice?.sublist(3));
    productPrice = productPrice?.sublist(3);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height:MediaQuery.of(context).size.height - 335,
        child: productNames == null || productImage == null || productLink == null || productDescriptions == null || productPrice == null || productRating == null
            ? Center(
                child:
                    CircularProgressIndicator(), // Loads Circular Loading Animation
              )
            : ListView.builder(
                itemCount: (productNames!.length) - 1,
                itemBuilder: (BuildContext context, int index) {
                  // Attributes are in the form of List<Map<String, dynamic>>.
                  Map<String, dynamic> image = productImage?[index]['attributes'];
                  Map<String, dynamic> attributes =
                      productLink![index]['attributes'];
                  return Container(
                      margin: EdgeInsets.all(10),
                      height: 180,
                      width: MediaQuery.of(context).size.width * 0.90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        elevation: 5,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              width: 150,
                              height: 200,
                              child: Image.network(
                                image['data-src'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(productNames?[index]['title'],
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        productDescriptions?[index]['title']
                                            .substring(7),
                                        style: TextStyle(fontSize: 10)),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 3.0),
                                            child: Text(
                                              productPrice?[index]['title'].length == 3 ? " " : productPrice![index]['title'] ,
                                              style: TextStyle(
                                                  color: Colors.red.shade900,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                  focusNode: FocusNode(),
                                                  onPressed: () {launch(webScraper.baseUrl! +
                                            attributes['href']);},
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: Colors.teal),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    )),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith<Color>(
                                                      (Set<MaterialState>
                                                          states) {
                                                        if (states.contains(
                                                            MaterialState
                                                                .pressed))
                                                          return Colors
                                                              .teal.shade200;
                                                        return Colors.white;
                                                      },
                                                    ),
                                                  ),
                                                  child: Text('Description',
                                                      style: TextStyle(
                                                          color: Colors.teal))),
                                              Text('Rating ${productRating?[index]['title']}',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.deepOrange)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ));
                }),
      ),
    );
  }
}