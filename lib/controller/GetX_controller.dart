import 'package:get/get.dart';

class controllerGetx extends GetxController {
  RxInt counter = 0.obs;

  increment() {
    counter++;
  }

  decrement() {
    counter--;
  }
}
