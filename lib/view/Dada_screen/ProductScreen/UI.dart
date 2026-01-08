import 'dart:developer';

import 'package:dada_garments_full_with_api/controller/widgets/custom_button.dart';
import 'package:dada_garments_full_with_api/controller/widgets/text.dart';
import 'package:flutter/material.dart';

import '../../controller/products/product_API.dart';
import '../checkout/UI.dart';
import 'Widgets/Product_Card_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.title});
  final String title;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List ProducFinaltList = [];
  List ProductList = [];
  bool isLoading = true;

  FatchData() async {
    isLoading = true;
    setState(() {});
    ProducFinaltList = await GetProductController().getProduct(
      id: widget.title,
    );
    ProductList = ProducFinaltList;
    isLoading = false;
    setState(() {});
  }

  // Only for searchField
  SearchData({required String search}) {
    ProductList = ProducFinaltList.where(
      (v) => v['title'].toString().toLowerCase().contains(search),
    ).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    FatchData();
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
          text: "Product's",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(13.0),
            child: TextField(
              onChanged: (v) {
                SearchData(search: v.toString());
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search_rounded),
                hintText: "Search hare...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.green.shade900),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.green.shade900),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.green.shade900),
                ),
              ),
            ),
          ),
          Expanded(
            child: isLoading == true
                ? Center(
                    child: CircularProgressIndicator(color: Color(0xffFF4444)),
                  )
                : ProductList.isEmpty
                ? Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Product not found..!",
                          color: Colors.green.shade500,
                        ),
                        Icon(
                          Icons.sentiment_dissatisfied_sharp,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    itemCount: ProductList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .65,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Product_Card_widget(AllData: ProductList[index]),
                    ),
                  ),
          ),

        ],
      ),
    );
  }
}
