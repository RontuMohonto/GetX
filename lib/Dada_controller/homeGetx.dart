import 'package:get/get.dart';
import 'package:studio_projects/Dada_controller/slider/slider.dart';

import 'Selling_items/selling_items.dart';
import 'category/categoryController.dart';

class HomeGetX extends GetxController {
  // SAME variable names (as your UI)
  RxList Sliderlist = [].obs;
  RxList Categorylist = [].obs;
  RxMap SellingList = {}.obs;
  RxBool isLoading = true.obs;

  Future<void> sliderfetchData() async {
    Sliderlist.value = await SliderController().getSliderData();
  }

  Future<void> categoryfetchData() async {
    Categorylist.value = await CategoryController().getCategoryData();
  }

  Future<void> SellingItemsfetchData() async {
    SellingList.value = await SellingItemsController().getSellingsItemsData();
  }

  Future<void> getData() async {
    try {
      isLoading.value = true;

      await Future.wait([
        sliderfetchData(),
        categoryfetchData(),
        SellingItemsfetchData(),
      ]);
    } catch (e) {
      print("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    getData();
  }
}
