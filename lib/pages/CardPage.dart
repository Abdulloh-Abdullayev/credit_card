import 'package:contact/controller/card_controller.dart';
import 'package:contact/models/card_model.dart';
import 'package:contact/pages/HomePage.dart';
import 'package:contact/services/http_service.dart';
import 'package:contact/views/item_of_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);
  static final String id = "CardPage";

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {


  @override
  void initState() {
    super.initState();
    Get.find<CardController>().apiGet();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Beneficiary", style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 1),),
          bottom: PreferredSize(
            preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height*0.08),
            child: Container(
              //height:30,
                width: MediaQuery.of(context).size.width/1.05,
                padding: EdgeInsets.only( bottom: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.10,

                  child: TextField(
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.grey.shade50,
                        filled: true,
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                )
            ),

          )
      ),
      body: GetBuilder<CardController>(
        init: CardController(),
        builder: (CardController controller) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Text("Recipients", style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 1),),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.list.length,
                  itemBuilder: (context, index){
                    return itemOfContact(controller.list[index], controller, context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(HomePage());
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add,color: Colors.white,size: 30,),
      ),
    );
  }
  
}
