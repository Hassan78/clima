import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  void getData() async{
    Response response = await get(url);  
  if(response.statusCode== 200){
    String data = response.body;
    var decodedData = jsonDecode(data);
  }
  else{
    print(response.statusCode);
  }
  }
}