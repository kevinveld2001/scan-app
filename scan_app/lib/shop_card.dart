import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:majascan/majascan.dart'; 
import 'api.dart';



class Shop_card extends StatefulWidget {
  @override
  _Shop_cardState createState() => _Shop_cardState();
}

class _Shop_cardState extends State<Shop_card> {
  List<String> cardList = [];

  void additem (String name, int price, String id){
   
    String newItemJson ='{"naam":"$name" , "price": "$price" , "count":"1","id": "$id"}';
    
    cardList.add(newItemJson);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("Self Scanner",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        
        ),
      body: Center(child:Text("hallo")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 138, 1, 1),
        onPressed: () async{
            String qrResult = await MajaScan.startScan(
                title: "scanner", 
                barColor: Color.fromRGBO(255, 138, 1, 1), 
                titleColor: Colors.white, 
                qRCornerColor: Color.fromRGBO(255, 138, 1, 1),
                qRScannerColor: Color.fromRGBO(255, 138, 1, 1),
                flashlightEnable: true
              );


              print(qrResult);
          var getdata = new RestApi(qrResult);
          var didIt = await getdata.loadData();
          if(didIt){
          String getname = await getdata.getname();
          double getprice = await getdata.getprice();
              print("add product: $getname prijs: ${getprice.toString()}");

            additem(getname, getprice.toInt(),qrResult);
          
           

           if (cardList.isNotEmpty){
                  print("new list: $cardList");
           }
          }else{
            print("error");
          }
          

        },
        child:Icon(Icons.add)),
    );
  }
}