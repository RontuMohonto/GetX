import 'package:flutter/material.dart';
import 'package:studio_projects/controller/product.dart';

class ProductLIst extends StatefulWidget {
  const ProductLIst({super.key});

  @override
  State<ProductLIst> createState() => _ProductLIstState();
}

class _ProductLIstState extends State<ProductLIst> {
  List data = [];

  fetchdata() async {
    data = await productservice().getdata();
    setState(() {});
  }

  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product list with api and getx")),

      body: ListView.builder(
        itemCount: data.length,
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${data[index]['title']}"),
                        Text("${data[index]['category']}"),
                        Row(
                          spacing: 20,
                          children: [
                            Text("${data[index]['price']}"),
                            Text(
                              "${data[index]['old_price']}",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
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
      ),
    );
  }
}
