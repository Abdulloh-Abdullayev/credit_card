import 'package:contact/models/card_model.dart';
import 'package:contact/services/http_service.dart';
import 'package:get/get.dart';

class CardController extends GetxController{
  List<Welcome> list = [];

  // users get
  void apiGet() {
    Network.GET(Network.API_CARDS, Network.paramEmpty()).then((value){
      if (value != null) {
        _showResponse(value);
      }
    });
  }

  // delete method
  void delete(String id) {
    Network.DELETE(Network.apidelete(id), Network.paramEmpty()).then((value) {
      if(value != null) {
        print(value);
        apiGet();
        update();
      } else {
        //error msg
      }
    });
  }


  void _showResponse(String response) {
    List <Welcome> listCard = Network.parseUsersList(response);
    list = listCard;
    update();
  }
}