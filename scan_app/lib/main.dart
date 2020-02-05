import 'package:flutter/material.dart';
import 'shop_card.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 138, 1, 1),
        

    fontFamily: 'roboto',
    
      ),
      home:Shop_card(),
      
    );
  }
}