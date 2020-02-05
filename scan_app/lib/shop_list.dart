import 'package:flutter/material.dart';

class Shop_list extends StatefulWidget {

  final List<String> list; 

  const Shop_list({ this.list});
  @override
  _Shop_listState createState() => _Shop_listState();
}

class _Shop_listState extends State<Shop_list> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list.length,
        itemBuilder:(BuildContext ctxt, int index) {
          return Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            elevation: 15,
            color: Color.fromRGBO(245, 245, 245, 1),
            child: Container(
              height: 100,
              child: InCard(carddata: widget.list[index]),
            ),
          ),
          ); 
          
           
      }
    );
  }
}


class InCard extends StatelessWidget {
  

     const InCard({this.carddata }); 


  final String carddata;

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}