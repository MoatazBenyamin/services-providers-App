import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';


class Crud {
  postRequest (String url , Map map) async {
    try{
      print("zzzzzzzzzzzzzzzzzzzzzzz");
      
      var response = await http.post(Uri.parse(url),body: map);
      print("result");
      print(jsonDecode(response.body));
      if (response.statusCode == 200 ){
        print("xzxz");
        var responseBody = jsonDecode(response.body) ;
        print(responseBody);
        return responseBody ;
      }else{
        print("xxxxxxxxxxxxx");
        print("Error :${response.statusCode}");
      }
    }catch(e){
      print("Error : $e");
    }
  }
  postRequestWithFile(String url,File file) async {
var request = http.MultipartRequest("POST", Uri.parse(url));
var length = await file.length();
var stream = http.ByteStream(file.openRead());
var multipartFile = http.MultipartFile("file", stream, length, filename:basename(file.path));
request.files.add(multipartFile);

var myrequest = await request.send();
var response = await http.Response.fromStream (myrequest);
if (myrequest.statusCode == 200){
return jsonDecode (response.body) ; 
}else {
print("Error ${myrequest.statusCode}") ;

}
}
}


