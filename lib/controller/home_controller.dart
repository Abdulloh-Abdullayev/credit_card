import 'package:contact/models/card_model.dart';
import 'package:contact/pages/CardPage.dart';
import 'package:contact/services/hive_services.dart';
import 'package:contact/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  List<Welcome> list = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController relativeController = TextEditingController();
  TextEditingController numberController = MaskedTextController(mask: "00 0000000");

  void apiCreateComment() {
    String name = nameController.text.trim().toString();
    String relative = relativeController.text.trim().toString();
    String number = numberController.text.trim().toString();


    Welcome value = Welcome(name: name, relative: relative, number: number, id: "");

    Network.POST(Network.API_CARDS, Network.paramsCreate(value)).then((value){
      Get.offAll(CardPage());
      update();
    });

    /// Saqlayapti
    HiveDB().storeUser(value);

    /// Olayapti
    var user = HiveDB().loadUser();
  }
}