import 'package:flutter/material.dart';
import 'shop_card.dart';
import 'package:provider/provider.dart';
import './notify.dart';
void main() => runApp(  MyApp()  );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>Notify(),
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 138, 1, 1),
        

    fontFamily: 'roboto',
    
      ),
      home:Shop_card(),
      
    ),
    ) ;
  }
}