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
      print(_data['fields']['name']['stringValue'].toString());
        //return the name from the product
       return _data['fields']['name']['stringValue'].toString();

    }
    
    Future<double> getprice() async {
      /*
      the data in the database can val under doublevalue and integervalue
      it will check withch it is and in case it is integerValue
      than it will be parst to double
      */
      if(_data['fields']['prijs']['doubleValue'] != null){
        
        return _data['fields']['prijs']['doubleValue'];
      
      }else if(_data['fields']['prijs']['integerValue'] != null){

        return double.parse(_data['fields']['prijs']['integerValue']);
      
      }

      //this line will make my editor to shut up
      return 0;
      
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

