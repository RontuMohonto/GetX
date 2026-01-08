import 'dart:developer';

import 'package:dada_garments_full_with_api/controller/Cart/controller.dart';
import 'package:dada_garments_full_with_api/controller/widgets/custom_button.dart';
import 'package:dada_garments_full_with_api/screen/checkout/UI.dart';
import 'package:flutter/material.dart';

import '../../controller/widgets/text.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List CartData = [];

  bool isloading = false;

  fetchData() async {
    isloading = true;
    CartData = await CartGetController().getdata();
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF4F4F), Color(0xFFFF9A37)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: CustomText(
          text: "Cart",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: isloading == true
          ? Center(child: CustomText(text: "Loading Cart's..."))
          : CartData.isEmpty
          ? Center(
              child: CustomText(text: "No cart found", color: Colors.black),
            )
          : ListView.builder(
              itemCount: CartData.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [Colors.green.shade200, Colors.green.shade50],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    spacing: 16,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://eplay.coderangon.com/storage/${CartData[index]['image']}",
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 6,
                          children: [
                            CustomText(
                              text: "${CartData[index]['title']}",
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "Brand: ${CartData[index]['brand']}",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                CustomText(
                                  text: "Total :",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text:
                                      "${CartData[index]['price']} x ${CartData[index]['quantity']} = ",
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: "৳${CartData[index]['total']}",
                                  color: Colors.green.shade900,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: CustomButton_widget(
            title: "Order Now",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CheckoutScreen(productData: CartData),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
