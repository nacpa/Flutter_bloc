

import 'dart:convert';

import 'package:http/http.dart';

import '../Models/UserModel.dart';
import 'package:http/http.dart' as http;

class Repositories{
  String  EndPoints="https://reqres.in/api/users?page=2";
  Future<List<Datum>> GetUsers()async{
    http.Response response= await  get(Uri.parse(EndPoints));
   if(response.statusCode==200){
     final List results=jsonDecode(response.body)['data'];
     print("Nachiketa");
     return results.map((e) => Datum.fromJson(e)).toList();


   }else{
     print("Nachiketa");
     throw Exception(response.reasonPhrase);

   }


 }
}

class Repositories2{
  String  EndPoints="https://reqres.in/api/users?page";
  Future<List<Datum>> GetUsers()async{
    http.Response response= await  get(Uri.parse(EndPoints));
   if(response.statusCode==200){
     final List results=jsonDecode(response.body)['data'];
     print("Nachiketa");
     return results.map((e) => Datum.fromJson(e)).toList();


   }else{
     print("Nachiketa");
     throw Exception(response.reasonPhrase);

   }


 }
}