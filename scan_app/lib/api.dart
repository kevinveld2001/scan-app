import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class RestApi{
  String _id; 
  var _data;
  RestApi(String id) {
  _id = id;
  
  }

    Future<String> getname() async {
        //return the name from the product
       return _data['fields']['name']['stringValue'].toString();

    }
    
    Future<double> getprice() async {
        //get and return price value 
       return _data['fields']['prijs']['doubleValue'].toDouble();

    }


  Future<bool> loadData() async {
        //get data from firebase by url
      http.Response res = await http.get(
        Uri.encodeFull("https://firestore.googleapis.com/v1/projects/scanapp-88027/databases/(default)/documents/items/$_id/"),
        headers: {
          "Accapt":"application/json"
        }
        );
        //decode the data
      var data = json.decode(res.body);
      
       _data = data;
      //check if data is afaleble
      if(data['name'] != null){
        return true;
      }else{
        return false;
      }

    }


}

