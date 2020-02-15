import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:majascan/majascan.dart';
import 'package:scan_app/notify.dart'; 
import 'api.dart';
import 'shop_list.dart';
import 'package:provider/provider.dart';
import './notify.dart';
class Shop_card extends StatefulWidget {
  @override
  _Shop_cardState createState() => _Shop_cardState();
}

class _Shop_cardState extends State<Shop_card> {
  
    List<String> cardList = [];

  void additem (String name, String price, String id){
   //make a niew object
    String newItemJson ='{"naam":"$name" , "price": "$price" , "count":"1","id": "$id"}';
    //add the niew object to the list
    cardList.add(newItemJson);
  }
  

  @override
  Widget build(BuildContext context) {

    var notify = Provider.of<Notify>(context);

    return Scaffold(
      appBar: AppBar(
          title:Text("Self Scanner - € ${notify.totalPrice.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        
        ),




      body: Shop_list(list: cardList),






      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(255, 138, 1, 1),
        onPressed: () async{

          //start barcode scanner
            String qrResult = await MajaScan.startScan(
                title: "scanner", 
                barColor: Color.fromRGBO(255, 138, 1, 1), 
                titleColor: Colors.white, 
                qRCornerColor: Color.fromRGBO(255, 138, 1, 1),
                qRScannerColor: Color.fromRGBO(255, 138, 1, 1),
                flashlightEnable: true
              );


              print(qrResult);
              //get data from firebase
          var getdata = new RestApi(qrResult);
          var didIt = await getdata.loadData();

          //check if data is found on firebase
          if(didIt){
          String getname = await getdata.getname();//get the product name
          double getprice = await getdata.getprice();//get product price
              print("add product: $getname prijs: ${getprice.toString()}");
            setState(() {
              //add item to list
              additem(getname, getprice.toStringAsFixed(2),qrResult);
              
              
              notify.add(getprice);
            });
            
          
           

           if (cardList.isNotEmpty){
             //if the item is not found in firebase
             //it should display a error in the app

                //TO DO
                  // #display error
                  // #system for check out

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