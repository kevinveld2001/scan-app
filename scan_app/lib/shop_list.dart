import 'package:flutter/material.dart';
import 'dart:convert';
import 'shop_card.dart';
import 'package:provider/provider.dart';
import 'notify.dart';

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
              height: 120,
              child: InCard(carddata: widget.list[index],index: index,),
            ),
          ),
          ); 
          
           
      }
    );
  }
}



class InCard extends StatefulWidget {
  
  const InCard({this.carddata, this.index}); 

  final String carddata;
  final int index;

  @override
  _InCardState createState() => _InCardState();
}

class _InCardState extends State<InCard> {
    int nummber = 1;
    
  @override
  Widget build(BuildContext context) {
    var notify = Provider.of<Notify>(context);

    return Container(
      child: Row(children: <Widget>[
        Container(
          child: Image.network("https://firebasestorage.googleapis.com/v0/b/scanapp-88027.appspot.com/o/items%2F${json.decode(widget.carddata)['id']}.png?alt=media"),
          width: 100,
          height: 120,
          
        ),
        
        Column(
          
          children: <Widget>[
          
               
                Text(
              json.decode(widget.carddata)['naam'],
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              
              ),
              
              
          
          Padding(
            padding: EdgeInsets.all(10),
          child:Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Text("€ "+json.decode(widget.carddata)['price'],),
            SizedBox(width:20),
            Text("x "+nummber.toString(),),
            SizedBox(width:20),
              IconButton( icon: Icon(Icons.arrow_drop_up),onPressed: (){
                setState(() {
                  nummber++;
                  notify.add(double.parse(json.decode(widget.carddata)['price']));
                  print(nummber);
                });
              },),
              
              IconButton( icon: Icon(Icons.arrow_drop_down),onPressed: (){
                setState(() {
                  nummber--;

                  if(nummber <= 0){
                    nummber = 1;
                    
                  }else{
                    notify.remove(double.parse(json.decode(widget.carddata)['price']));
                  }
                  print(nummber);
                });
              },),
          ],),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.start,
        ),
        
      ],
      
      ),
      
    );
  }
}