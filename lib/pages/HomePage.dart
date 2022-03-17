import 'package:credit_card/models/card_model.dart';
import 'package:credit_card/pages/CardPage.dart';
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

  TextEditingController numberController = MaskedTextController(mask: "000 000 000");
  TextEditingController dataController = MaskedTextController(mask: "00/00");
  TextEditingController cvvController = MaskedTextController(mask: "000");

  void apiCreateComment() {
    String cardNumber = numberController.text.trim().toString();
    String data = dataController.text.trim().toString();
    String cvv = cvvController.text.trim().toString();


    Welcome value = Welcome(cardNumber: cardNumber, data: data, cvv: cvv, id: "");

    Network.POST(Network.API_CARDS, Network.paramsCreate(value)).then((value){
      setState(() {
        Navigator.pushReplacementNamed(context, CardPage.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Add your card", style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text("Your card number", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: numberController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Card Number',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width/3,
                    child: TextField(
                      controller: dataController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'Data',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width/3,
                    child: TextField(
                      controller: cvvController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: 'CVV',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
              ],
            ),
            SizedBox(height: 40,),

            Container(
              height: 40,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)
                ),
                onPressed: (){
                  apiCreateComment();
                },
                color: Colors.blueAccent,
                child: Text("Add Card", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
