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
      body: SingleChildScrollView(
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
                itemCount: list.length,
                itemBuilder: (contex, index){
                  return Slidable(
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
                                icon: const Icon(Icons.delete, color: Colors.red,),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: ListTile(
                        leading: ClipOval(
                          child: Image.asset("assets/images/img_2.png"),
                        ),
                        title: Text(list[index].name, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
                        subtitle:  Text(list[index].number, style: TextStyle(color: Colors.blueGrey, fontSize: 16,),),
                        trailing: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          onPressed: (){},
                          color: Colors.blue,
                          child: Text("Send", style: TextStyle(color: Colors.white, fontSize: 16,),),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, HomePage.id);
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add,color: Colors.white,size: 30,),
      ),
    );
  }
  
}
