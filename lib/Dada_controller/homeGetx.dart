

import 'package:get/get.dart';
import 'package:studio_projects/Dada_controller/slider/slider.dart';

import 'Selling_items/selling_items.dart';
import 'category/categoryController.dart';

class HomeGetX extends GetxController{
  bool isLoading = false;
  //empty list to add fetchdata
  List Sliderlist = [];
  List Categorylist = [];
  Map SellingList = {};

  sliderfetchData() async {
    isLoading = true;
    Sliderlist = await SliderController().getSliderData();
    categoryfetchData();
  }

  categoryfetchData() async {
    Categorylist = await CategoryController().getCategoryData();
    SellingItemsfetchData();
  }

  SellingItemsfetchData() async {
    SellingList = await SellingItemsController().getSellingsItemsData();
    isLoading = false;

  }
  //auto call
  @override
  void initState() {
    isLoading = true;
    sliderfetchData();
    super.initState();
  }
}