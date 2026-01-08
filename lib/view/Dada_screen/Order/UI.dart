import 'dart:developer';

import 'package:dada_garments_full_with_api/controller/OrderList/Controller.dart';
import 'package:dada_garments_full_with_api/controller/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../controller/widgets/text.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  TextEditingController searchController = TextEditingController();
  List OrderData = [];
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    OrderData = await OrderListController().getData(
      phone: searchController.text,
    );
    log("=======${OrderData}========");
    isLoading = false;

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
      //appbar
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
          text: "Order History",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
  //order
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              spacing: 6,
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: "Search hare...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.green.shade900,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.green.shade900,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.green.shade900,
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: CustomButton_widget(
                    title: "search",
                    onTap: () {
                      fetchData();
                    },
                  ),
                ),
              ],
            ),
          ),
          isLoading == true
              ? Center(child: CircularProgressIndicator())
              : OrderData.isEmpty
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "No order found...",
                    color: Colors.green.shade900,
                  ),
                  Icon(
                    Icons.sentiment_dissatisfied_outlined,
                    color: Colors.red,
                  ),
                ],
              )
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: OrderData.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [
                              Colors.green.shade200,
                              Colors.green.shade50,
                            ],
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "${OrderData[index]['order_id']}",
                                    color: Colors.black,
                                  ),

                                  CustomText(text: "COD", color: Colors.black),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 4,
                                    children: [
                                      Icon(Icons.person),
                                      CustomText(
                                        text:
                                            "${OrderData[index]['customer_name']}",
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 4,
                                    children: [
                                      Icon(Icons.call, color: Colors.black),
                                      CustomText(
                                        text:
                                            "${OrderData[index]['customer_phone']}",
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                      spacing: 4,
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.black,
                                        ),
                                        CustomText(
                                          text:
                                              "${OrderData[index]['address']['street']},${OrderData[index]['address']['upazila']},${OrderData[index]['address']['district']},",
                                          maxLines: 10,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                spacing: 4,
                                children: [
                                  CustomText(
                                    text: "৳",
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    text: "${OrderData[index]['total_amount']}",
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
