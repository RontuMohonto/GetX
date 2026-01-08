import 'dart:convert';
import 'dart:developer';
import 'package:dada_garments_full_with_api/controller/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../controller/Checkout/CheckOut_Controller.dart';
import '../../controller/widgets/text.dart';
import '../Shipping_info/UI.dart';
import '../home/UI.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.productData});
  final List productData;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Map userData = {};
  List product = [];

  getUserData() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    var d = await storage.read(key: "shipping");
    if (d != null) {
      if (d != null) {
        userData = jsonDecode(d);
      }
      setState(() {});
    }
    setState(() {});
  }

  getProductData() async {
    product = widget.productData;
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

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
          text: "Checkout",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // informations
            Row(
              children: [
                CustomText(
                  text: "Shipping Information",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade900,
                ),
                SizedBox(width: 181),
                InkWell(
                  onTap: () {
                    log("===== Pressed ..!========");
                    FlutterSecureStorage storage = FlutterSecureStorage();
                    storage.delete(key: "shipping");
                  },
                  child: Icon(Icons.delete, color: Colors.red, size: 25),
                ),
              ],
            ),
            const SizedBox(height: 10),

            userData.isEmpty
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ShippingScreen()),
                      ).then((_) => getUserData());
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF4F4F), Color(0xFFFF9A37)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: Colors.green.shade900),
                      ),
                      child: Center(
                        child: Column(
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              size: 40,
                              color: Colors.white,
                            ),
                            CustomText(
                              text: "Add Shipping Information",
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Row(
                              children: [
                                CustomText(text: "Name    : "),
                                Expanded(
                                  child: CustomText(
                                    text: "${userData['name']}",
                                    color: Colors.green.shade900,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                CustomText(text: "Phone   : "),
                                Expanded(
                                  child: CustomText(
                                    text: "${userData['phone']}",
                                    color: Colors.green.shade900,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: "Address: "),
                                Expanded(
                                  child: CustomText(
                                    text:
                                        "${userData['street']}, ${userData['upazila']}, ${userData['district']}",
                                    color: Colors.green.shade900,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        top: 10,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ShippingScreen(),
                              ),
                            ).then((c) => getUserData());
                          },
                          child: Icon(Icons.edit, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),

            const SizedBox(height: 20),

            //product card
            CustomText(
              text: "Products...",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
            const SizedBox(height: 10),
            //products
            Expanded(
              child: ListView.builder(
                itemCount: product.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                                "https://eplay.coderangon.com/storage/${product[index]['image']}",
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
                              text: "${product[index]['title']}",
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            CustomText(
                              text: "Brand: ${product[index]['brand']}",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            Row(
                              spacing: 10,
                              children: [
                                CustomText(
                                  text: "BDT ${product[index]['price']}",
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: "${product[index]['old_price']}",
                                  decorationText: TextDecoration.lineThrough,
                                  color: Colors.black,
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

            //button disi ekhane
            CustomButton_widget(
              title: "Confirm Checkout",
              onTap: () async {
                List orderItem = [];
                for (var item in product) {
                  var a = {
                    "product_id": item['id'],
                    "product_name": item['title'],
                    "price": item['price'],
                    "quantity": 1,
                  };
                  orderItem.add(a);
                }
                var checkout = {
                  "customer_name": userData['name'],
                  "customer_phone": userData['phone'],
                  "payment_method": "cod",
                  "items": orderItem,
                  "address": {
                    "street": userData['street'],
                    "upazila": userData['upazila'],
                    "district": userData['district'],
                  },
                };

                // log("Checkout: ${jsonEncode(checkout)}");
                log(
                  "================================working==========================",
                );
                bool status = await CheckOutService().sentData(data: checkout);

                if (status == true) {
                  EasyLoading.showSuccess("Order Submitted..");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
