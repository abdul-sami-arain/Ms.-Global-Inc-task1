import 'package:flutter/material.dart';
import 'package:task1/pages/subpages/data.dart';
import 'package:task1/pages/subpages/info.dart';

class Landing extends StatelessWidget {
  String? name;
  String? username;
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  int? id;
   Landing({super.key, 
    required this.name,
    required this.city,
    required this.street,
    required this.suite,
    required this.username,
    required this.zipcode,
    required this.id
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(  
        body: DefaultTabController(  
        length: 2,  
        child: Scaffold(  
          appBar: AppBar(  
            backgroundColor: Color(0xffE43228), 
            title: Text("lorem lipsum"),
          leading: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.menu,
              ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )
            ),
          ],
            bottom: TabBar(  
              indicatorColor: Colors.white,
              tabs: [  
                Tab(text: "ALL POSTS"),  
                Tab(text: "PROFILE")  
              ],  
            ),  
          ),  
          body: TabBarView(  
            children: [  
              Data(id:this.id),  
              Info(city: this.city, name: this.name, street: this.street, suite: this.suite, username: this.username, zipcode: this.zipcode,),  
            ],  
          ),  
        ),  
      ),  
    ),
      
    );
  }
}