import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../pages/landing.dart';

class Login_Provider extends ChangeNotifier{
  List<User> users = [];
  
  void login(String name , String username, [ BuildContext? context] ) async {
   try {
      var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));

    if (response.statusCode==200) {
      var jsondata = jsonDecode(response.body);

        for (var i in jsondata) {
          User user = User( i['name'], i['username'], i['address']['street'], i['address']['suite'], i['address']['city'], i['address']['zipcode'],i['id']);
          if (i['name']==name && i['username']==username) {       
            users.add(user);
            Navigator.push(context!,
                            MaterialPageRoute(builder: (context) => Landing(
                              name:user.name,username: user.username,street: user.street,city: user.city,suite: user.suite,zipcode: user.zipcode,id: user.id,
                            )));
            print("Login Successfully");    
            break;
          }
          else{
            
            // break;
          }
        }
    print(users);
    } else {
       showDialog(
                context: context!,
                builder: (ctx) => AlertDialog(
                  title: const Text("Alert  Box"),
                  content:  Text("${response.statusCode}" + " error found"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        
                      },
                      child: Container(
                        color: Color(0xffAF0917),
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );
    }
   } catch (e) {
    showDialog(
                context: context!,
                builder: (ctx) => AlertDialog(
                  title: const Text("Alert  Box"),
                  content:  Text(e.toString()),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        
                      },
                      child: Container(
                        color: Color(0xffAF0917),
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                ),
              );
   }
  }
}
class User {
  
  String? name;
  String? username;
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  int? id;
  
  User( this.name, this.username, this.street,this.suite,this.city,this.zipcode,this.id);
}