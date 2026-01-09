import 'package:get/get.dart';
import 'package:studio_projects/Dada_controller/slider/slider.dart';

import 'Selling_items/selling_items.dart';
import 'category/categoryController.dart';

class HomeGetX extends GetxController {
  //empty list to add fetchdata
  List Sliderlist = [];
  List Categorylist = [];
  Map SellingList = {};
  bool isLoading = true;

  sliderfetchData() async {
    Sliderlist = await SliderController().getSliderData();
  }

  categoryfetchData() async {
    Categorylist = await CategoryController().getCategoryData();
  }

  SellingItemsfetchData() async {
    SellingList = await SellingItemsController().getSellingsItemsData();
  }

  getData() async {
    await sliderfetchData();
    await categoryfetchData();
    await SellingItemsfetchData();
  }

  //auto call
  @override
  void onReady() {
    getData();
    super.onReady();
  }
}
