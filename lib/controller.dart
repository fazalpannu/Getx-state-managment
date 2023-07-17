// ignore: camel_case_types
import 'package:get/get.dart';

class controller extends GetxController {
  RxInt counter = 1.obs;
  int x = 0;
  increment() {
    x++;
    counter.value++;
    print(counter.value.toString());
  }
}
