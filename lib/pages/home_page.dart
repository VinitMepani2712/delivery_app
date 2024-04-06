import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/pages/details.dart';
import 'package:delivery_app/services/database.dart';
import 'package:delivery_app/widget/widget_support.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool burger = false, pizza = false, salad = false, icecream = false;

  Stream? foodItemStream;

  onTheLoad() async {
    foodItemStream = await DatabaseMethod().getFoodItem("Burgers");
    setState(() {});
  }

  @override
  void initState() {
    onTheLoad();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(
      stream: foodItemStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailsPage(
                            image: documentSnapshot["Image"],
                            name: documentSnapshot["Name"],
                            details: documentSnapshot["Details"],
                            price: documentSnapshot["Price"],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20, bottom: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(28),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  documentSnapshot["Image"],
                                  height: 130,
                                  width: 130,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      documentSnapshot["Name"],
                                      style: AppWidget.foodNameTextStyle(),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      documentSnapshot["Details"],
                                      style:
                                          AppWidget.foodDescriptionTextStyle(),
                                      maxLines: 1,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      '\u{20B9}' + documentSnapshot["Price"],
                                      style: AppWidget.priceTextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : CircularProgressIndicator();
      },
    );
  }

  // Widget allItems() {
  //   return StreamBuilder(
  //     stream: foodItemStream,
  //     builder: (context, AsyncSnapshot snapshot) {
  //       return snapshot.hasData
  //           ? ListView.builder(
  //               padding: EdgeInsets.zero,
  //               itemCount: snapshot.data.docs.length,
  //               shrinkWrap: true,
  //               scrollDirection: Axis.horizontal,
  //               itemBuilder: (context, index) {
  //                 DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
  //                 return GestureDetector(
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => FoodDetailsPage(
  //                           image: documentSnapshot["Image"],
  //                           name: documentSnapshot["Name"],
  //                           details: documentSnapshot["Details"],
  //                           price: documentSnapshot["Price"],
  //                         ),
  //                       ),
  //                     );
  //                   },
  //                   child: Container(
  //                     margin: const EdgeInsets.all(4),
  //                     child: Material(
  //                       elevation: 5.0,
  //                       borderRadius: BorderRadius.circular(20),
  //                       child: Container(
  //                         padding: const EdgeInsets.all(10),
  //                         child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           children: [
  //                             ClipRRect(
  //                               borderRadius: BorderRadius.circular(20),
  //                               child: Image.network(
  //                                 documentSnapshot["Image"],
  //                                 height: 150,
  //                                 width: 150,
  //                                 fit: BoxFit.cover,
  //                               ),
  //                             ),
  //                             const SizedBox(
  //                               height: 10,
  //                             ),
  //                             Text(
  //                               documentSnapshot["Name"],
  //                               style: AppWidget.foodNameTextStyle(),
  //                             ),
  //                             Text(
  //                               documentSnapshot["Details"],
  //                               style: AppWidget.foodDescriptionTextStyle(),
  //                               maxLines: 2,
  //                             ),
  //                             Text(
  //                               // ignore: prefer_interpolation_to_compose_strings
  //                               '\u{20B9}' + documentSnapshot["Price"],
  //                               style: AppWidget.priceTextStyle(),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             )
  //           : CircularProgressIndicator();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 50,
            left: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello Vinit,",
                    style: AppWidget.textStyle(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome!!",
                style: AppWidget.headerTextStyle(),
              ),
              Text(
                "Discover and get your favorite dishes!!",
                style: AppWidget.lightTextStyle(),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.only(right: 20), child: showItem()),
              const SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 270,
              //   //width: double.minPositive,
              //   child: allItems(),
              // ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: allItemsVertically(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            burger = true;
            pizza = false;
            salad = false;
            icecream = false;
            foodItemStream = await DatabaseMethod().getFoodItem("Burgers");

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              decoration: BoxDecoration(
                color: burger ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                "images/burger.png",
                height: 45,
                width: 45,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            burger = false;
            pizza = true;
            salad = false;
            icecream = false;
            foodItemStream = await DatabaseMethod().getFoodItem("Pizza");

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              decoration: BoxDecoration(
                color: pizza ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                "images/pizza.png",
                height: 45,
                width: 45,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            burger = false;
            pizza = false;
            salad = true;
            icecream = false;
            foodItemStream = await DatabaseMethod().getFoodItem("Salad");

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              decoration: BoxDecoration(
                color: salad ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                "images/salad.png",
                height: 45,
                width: 45,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            burger = false;
            pizza = false;
            salad = false;
            icecream = true;
            foodItemStream = await DatabaseMethod().getFoodItem("Ice-Cream");

            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              decoration: BoxDecoration(
                color: icecream ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                "images/ice-cream.png",
                height: 45,
                width: 45,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
