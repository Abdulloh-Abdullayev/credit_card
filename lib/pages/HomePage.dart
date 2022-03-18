import 'package:credit_card/models/card_model.dart';
import 'package:credit_card/pages/CardPage.dart';
import 'package:credit_card/services/hive_services.dart';
import 'package:credit_card/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Welcome> list = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController relativeController = TextEditingController();
  TextEditingController numberController = MaskedTextController(mask: "00 0000000");

  void apiCreateComment() {
    String name = nameController.text.trim().toString();
    String relative = relativeController.text.trim().toString();
    String number = numberController.text.trim().toString();


    Welcome value = Welcome(name: name, relative: relative, number: number, id: "");

    /// Saqlayapti
    HiveDB().storeUser(value);

    /// Olayapti
    var user = HiveDB().loadUser();

    Network.POST(Network.API_CARDS, Network.paramsCreate(value)).then((value){
      setState(() {
        Navigator.pushReplacementNamed(context, CardPage.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 60,right: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text("Add Recipients",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                    ),
                    SizedBox(height: 60,),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Name",style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      child: TextField(
                        controller: nameController,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: "What's your name?",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Relationship",style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      child: TextField(
                        controller: relativeController,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: "What's your Relationship name?",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text("Phone Number",style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      child: TextField(
                        controller: numberController,
                        style: TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            fillColor: Colors.grey.shade50,
                            filled: true,
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 70,top: 100),
                      width: MediaQuery.of(context).size.width/3,
                      height: 40,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60)
                        ),
                        onPressed: (){
                          apiCreateComment();
                        },
                        color: Colors.blue,
                        child: Text("Save",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
