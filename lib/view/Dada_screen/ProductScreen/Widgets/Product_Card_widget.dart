import 'dart:developer';
import 'package:dada_garments_full_with_api/controller/add_to_cart/controller.dart';
import 'package:dada_garments_full_with_api/controller/products/product_API.dart';
import 'package:dada_garments_full_with_api/screen/Details_products/UI.dart';
import 'package:flutter/material.dart';
import '../../../controller/widgets/text.dart';

class Product_Card_widget extends StatefulWidget {
  const Product_Card_widget({super.key, this.AllData});

  final dynamic AllData;

  @override
  State<Product_Card_widget> createState() => _Product_Card_widgetState();
}

class _Product_Card_widgetState extends State<Product_Card_widget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => Details(Pid: widget.AllData['id'])),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(
                children: [
                  Image.network(
                    "https://eplay.coderangon.com/public/storage/${widget.AllData['image']}",
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Image.asset("assets/images/offer.png", height: 42),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: widget.AllData['title'],
                    maxLines: 1,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  SizedBox(height: 6),

                  Row(
                    children: [
                      CustomText(
                        text: "৳ ${widget.AllData['price']}",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                      ),
                      SizedBox(width: 10),
                      CustomText(
                        text: "৳ ${widget.AllData['old_price']}",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red.shade300,
                        decorationText: TextDecoration.lineThrough,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),

                  // add cart button
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        log("========= Add to cart====================");
                        await AddToCartController().addtocart(
                          id: widget.AllData['id'],
                          qty: 1,
                        );
                      },
                      child: Container(
                        height: 42,
                        width: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.green.shade600,
                              Colors.green.shade400,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withOpacity(0.3),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: CustomText(
                            text: "Add to Cart",
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
