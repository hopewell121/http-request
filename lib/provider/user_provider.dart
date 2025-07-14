import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/model/user_model.dart';

class UserProvider extends ChangeNotifier{

  //create a setter

  List<UserModel> _users =[];

  //create a getter

  List<UserModel>get userinfo => _users;

  // fetches user data from the API and update the user list
  // if the status code is 200. otherwise it throws an exception.

  

  Future <void> getData()async{

    //define the url

    final String url ='https://jsonplaceholder.typicode.com/users';
    var response = await http.get(Uri.parse(url), 
    
    headers:{'Content-Type': 'application/json',} );


    if (response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      List<UserModel> data = body.map((e) => UserModel.fromJson(e)).toList();
    _users= data;
    notifyListeners();
    //  print(response.body);

    } else {
      print('The status code is ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }
}