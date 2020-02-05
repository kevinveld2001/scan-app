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

       return _data['fields']['name']['stringValue'].toString();

    }
    
    Future<double> getprice() async {

       return _data['fields']['prijs']['doubleValue'];

    }


  Future<bool> loadData() async {

      http.Response res = await http.get(
        Uri.encodeFull("https://firestore.googleapis.com/v1/projects/scanapp-88027/databases/(default)/documents/items/$_id/"),
        headers: {
          "Accapt":"application/json"
        }
        );
        
      var data = json.decode(res.body);
      
       _data = data;

      if(data['name'] != null){
        return true;
      }else{
        return false;
      }

    }


}

