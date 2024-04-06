import 'package:delivery_app/services/database.dart';
import 'package:delivery_app/services/sharedpref.dart';
import 'package:delivery_app/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodDetailsPage extends StatefulWidget {
  String image, name, details, price;

  FoodDetailsPage(
      {super.key,
      required this.image,
      required this.name,
      required this.details,
      required this.price});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int orderCountDown = 1;
  int totalPrice = 0;
  String? id;

  getthesharedpref() async {
    id = await SharedPreferencesHelper().getUserId();
    setState(() {});
  }

  onTheLoad() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    onTheLoad();
    totalPrice = int.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: AppWidget.foodNameTextStyle(),
                    ),
                    // Text(
                    //   widget.details,
                    //   style: AppWidget.foodDescriptionTextStyle(),
                    // ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (orderCountDown > 1) {
                      --orderCountDown;
                      totalPrice = totalPrice - int.parse(widget.price);

                      setState(() {});
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  orderCountDown.toString(),
                  style: AppWidget.countTextStyle(),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    ++orderCountDown;
                    totalPrice = totalPrice + int.parse(widget.price);

                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.details,
              maxLines: 3,
              style: AppWidget.foodDetailsTextStyle(),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Delivery Time",
                  style: AppWidget.foodDetailsTextStyle(),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.alarm, color: Colors.black),
                Text(
                  "30 min",
                  style: AppWidget.foodDetailsTextStyle(),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: AppWidget.priceTextStyle(),
                      ),
                      Text(
                        '\u{20B9}' + totalPrice.toString(),
                        style: AppWidget.priceTextStyle(),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      Map<String, dynamic> addFoodtoCart = {
                        "Name": widget.name,
                        "Quantity": orderCountDown.toString(),
                        "Total": totalPrice.toString(),
                        "Image": widget.image,
                      };

                      await DatabaseMethod().addFoodToCart(addFoodtoCart, id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Text(
                            "Food Item has been added to cart",
                            style: AppWidget.lightTextStyle(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(4),
                              child: const Icon(Icons.shopping_cart_checkout,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
