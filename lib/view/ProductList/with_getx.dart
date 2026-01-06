import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Counter/GetX.dart';

class ProductLIst_getx extends StatelessWidget {
  ProductLIst_getx({super.key});

  final ProductsGetXController pc = Get.put(ProductsGetXController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product list with api and getx")),

      body: Obx(()=>  ListView.builder(
        itemCount: pc.data.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 130,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${pc.data[index]['title']}"),
                        Text("${pc.data[index]['category']}"),
                        Row(
                          spacing: 20,
                          children: [
                            Text("${pc.data[index]['price']}"),
                            Flexible(
                              child: Text(
                                "${pc.data[index]['old_price']}",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
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
      ),)
    );
  }
}
