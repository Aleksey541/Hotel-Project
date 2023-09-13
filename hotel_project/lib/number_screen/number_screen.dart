import 'package:flutter/material.dart';
import 'package:hotel_project/number_screen/number.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final List _posts = [
    "Post 1 ",
    "Post 2",
  ];

  List<String> title =[
    "Стандартный с видом на бассейн или сад",
    "Люкс номер с видом на море"
  ];
  List<String> prise = [
    "186 600 ₽",
    "289 400 ₽"
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          }, 
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)
        ),
        shadowColor: Color(0),
        backgroundColor: Colors.white,
        title: Text(
          "Steigenberger Makadi",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return Number(
            title: title[index],
            prise: prise[index],
          );
        },
      )
      
     
    );
  }
}