import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:studio_projects/Dada_controller/homeGetx.dart';

import '../../../Dada_controller/Selling_items/selling_items.dart';
import '../../../Dada_controller/category/categoryController.dart';
import '../../../Dada_controller/slider/slider.dart';
import '../../../Dada_controller/widgets/text.dart';
import '../Cart/UI.dart';
import '../Order/UI.dart';
import '../ProductScreen/UI.dart';
import '../ProductScreen/Widgets/Product_Card_widget.dart';
import 'package:get/get.dart';

class home extends StatelessWidget {
  home({super.key});

  final HomeGetX hg = Get.put(HomeGetX());

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
          text: "Home",
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          SizedBox(
            width: 45,
            child: InkWell(
              onTap: () {
                log("===Pressed .!====");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => OrderScreen()),
                );
              },
              child: Icon(Icons.history, color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: hg.isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: .9,
                    height: 170,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    enlargeCenterPage: true,
                    enlargeFactor: 0.25,
                  ),
                  items: hg.Sliderlist.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.25),
                                blurRadius: 12,
                                spreadRadius: 2,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Stack(
                              children: [
                                //image add korsi ekhane
                                Image.network(
                                  "https://eplay.coderangon.com/storage/${i['image']}",
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),

                                //new black color
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(0.0),
                                          Colors.black.withOpacity(0.25),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                //categories
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Category", color: Colors.black),
                      SizedBox(height: 15),
                      SizedBox(
                        height: 120,
                        // width: MediaQuery.sizeOf(context).width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hg.Categorylist.length,
                          itemBuilder: (context, i) => Container(
                            margin: EdgeInsets.only(right: 12),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    log(
                                      "====${hg.Categorylist[i]['id']}=======",
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductScreen(
                                          title: "${hg.Categorylist[i]['id']}",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    children: [
                                      //picture disi
                                      Container(
                                        height: 105,
                                        width: 95,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.green.withOpacity(
                                                0.25,
                                              ),
                                              blurRadius: 10,
                                              spreadRadius: 2,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                          child: Image.network(
                                            "https://eplay.coderangon.com/storage/${hg.Categorylist[i]['image']}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      //name disi category er
                                      Positioned(
                                        bottom: 6,
                                        left: 0,
                                        right: 0,
                                        child: Center(
                                          child: Text(
                                            "${hg.Categorylist[i]['name']}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 6,
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                ),
                                              ],
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //Hot selling
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Hot selling", color: Colors.black),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductScreen(title: "hot-selling"),
                                ),
                              );
                            },
                            child: CustomText(
                              text: "See All",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 310,

                        width: MediaQuery.sizeOf(context).width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hg.SellingList['hot-selling'].length,
                          itemBuilder: (context, i) => SizedBox(
                            width: 200,
                            child: Product_Card_widget(
                              AllData: hg.SellingList['hot-selling'][i],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      //Top selling
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "Top selling", color: Colors.black),
                          InkWell(
                            onTap: () {
                              log("=====Top selling====");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductScreen(title: "top-selling"),
                                ),
                              );
                            },
                            child: CustomText(
                              text: "See All",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 310,

                        width: MediaQuery.sizeOf(context).width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hg.SellingList['top-selling'].length,
                          itemBuilder: (context, i) => SizedBox(
                            width: 200,
                            child: Product_Card_widget(
                              AllData: hg.SellingList['top-selling'][i],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),

                      //New Product
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          CustomText(text: "New Product", color: Colors.black),
                          InkWell(
                            onTap: () {
                              log("====Latest products==========");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductScreen(title: "latest"),
                                ),
                              );
                            },
                            child: CustomText(
                              text: "See All",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 310,

                        width: MediaQuery.sizeOf(context).width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: hg.SellingList['new-product'].length,
                          itemBuilder: (context, i) => SizedBox(
                            width: 200,
                            child: Product_Card_widget(
                              AllData: hg.SellingList['new-product'][i],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),



      //float button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Cart()));
        },
        elevation: 6,
        backgroundColor: Colors.transparent,
        child: Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFF4F4F), Color(0xFFFF9A37)],
            ),
          ),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
