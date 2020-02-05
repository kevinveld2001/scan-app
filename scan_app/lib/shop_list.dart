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
          return new Text(widget.list[index]);
      }
    );
  }
}