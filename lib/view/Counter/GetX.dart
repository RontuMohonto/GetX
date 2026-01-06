import 'package:get/get.dart';
import 'package:studio_projects/controller/API_product.dart';

class ProductsGetXController extends GetxController {
  RxList data = [].obs;

  getproduct() async {
    data.value = await productservice().getdata();
  }

  @override
  void onReady() {
    getproduct();
    super.onReady();
  }
}
