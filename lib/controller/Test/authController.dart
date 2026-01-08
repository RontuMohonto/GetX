import 'package:get/get.dart';

class authController extends GetxController {
  RxInt selected = 2.obs;

  signUpTab() {
    selected.value = 2;
  }

  signInTab() {
    selected.value = 1;
  }
}
