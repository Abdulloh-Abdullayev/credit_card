import 'package:credit_card/models/card_model.dart';
import 'package:credit_card/pages/HomePage.dart';
import 'package:credit_card/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);
  static final String id = "CardPage";

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {

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
        setState(() {
          apiGet();
        });
      } else {
        //error msg
      }
    });
  }


  void _showResponse(String response) {
    List <Welcome> listCard = Network.parseUsersList(response);
    setState(() {
      list = listCard;
    });
  }

  @override
  void initState() {
    apiGet();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: list.length,
                itemBuilder: (context, index){
                  return Container(
                    color: Colors.white,
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SizedBox(
                            width: 150,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: IconButton(
                                  onPressed: (){
                                    delete(list[index].id);
                                  },
                                  icon: const Icon(Icons.delete, color: Colors.black,),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Card(
                          color: Colors.blue,
                          elevation: 5,
                          child: Column(
                            children: [
                              Container(
                                child: Text("VISA",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                                padding: EdgeInsets.all(20),
                                alignment: Alignment.centerRight,
                              ),
                              Container(
                                child: Text(list[index].cardNumber,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                padding: EdgeInsets.all(20),
                                alignment: Alignment.center,
                              ),
                              Container(
                                child: Text(list[index].cvv,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                padding: EdgeInsets.all(20),
                                alignment: Alignment.centerLeft,
                              ),
                              Container(
                                child: Text(list[index].data,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                padding: EdgeInsets.all(20),
                                alignment: Alignment.bottomRight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              child: Container(width: double.infinity,
                height: 300,
                padding: EdgeInsets.all(20),
                child: Card(
                  elevation: 5,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("Add Card",style: TextStyle(color: Colors.black,fontSize: 25),),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}