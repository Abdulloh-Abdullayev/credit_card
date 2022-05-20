import 'package:contact/controller/card_controller.dart';
import 'package:contact/models/card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart';

Widget itemOfContact(Welcome welcome, CardController mainController, BuildContext context){
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
                  // delete(list[index].id);
                  mainController.delete(welcome.id);
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
        title: Text(welcome.name, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),),
        subtitle:  Text(welcome.number, style: TextStyle(color: Colors.blueGrey, fontSize: 16,),),
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
}