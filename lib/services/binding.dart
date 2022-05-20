import 'package:contact/controller/card_controller.dart';
import 'package:contact/controller/home_controller.dart';
import 'package:get/get.dart';

class ControllersBinding implements Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
    Get.put<CardController>(CardController());
  }
}