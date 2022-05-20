import 'package:contact/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Get.find<HomeController>().nameController.clear();
    Get.find<HomeController>().relativeController.clear();
    Get.find<HomeController>().numberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
          body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (HomeController controller) => Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 60,right: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: (){
                            Get.isDarkMode
                                ? Get.changeTheme(ThemeData.light())
                                : Get.changeTheme(ThemeData.dark());
                            Get.snackbar(
                              "DarkMode",
                              "Succesfully",
                            );
                          },
                          icon: Icon(Icons.dark_mode,size: 30,),
                        ),
                      ),

                      SizedBox(height: 20,),
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
                          controller: controller.nameController,
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
                          controller: controller.relativeController,
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
                          controller: controller.numberController,
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
                            controller.apiCreateComment();
                          },
                          color: Colors.blue,
                          child: Text("Save",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}
