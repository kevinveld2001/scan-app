

class Shop_list{

    List<String> cardList = [];

  void additem (String name, int price, String id){
   
    String newItemJson ='{"naam":"$name" , "price": "$price" , "count":"1","id": "$id"}';
    
    cardList.add(newItemJson);
  }
}