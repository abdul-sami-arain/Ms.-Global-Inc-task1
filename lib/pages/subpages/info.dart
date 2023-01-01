import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  String? name;
  String? username;
  String? street;
  String? suite;
  String? city;
  String? zipcode;
   Info({super.key, 
    required this.name,
    required this.city,
    required this.street,
    required this.suite,
    required this.username,
    required this.zipcode
    
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Name",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 21),),
              Text("${this.name}",style: TextStyle(fontSize: 21),)
            ],
          ),
          Divider(color: Color(0xffF4F4F4),),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Username",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 21),),
              Text("${this.username}",style: TextStyle(fontSize: 21),)
            ],
          ),
          Divider(color: Color(0xffF4F4F4),),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Address",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 21),),
              Text("${this.street}"+" "+"${this.suite}"+",\n\t"+"${this.city}",style: TextStyle(fontSize: 21),)
            ],
          ),
          Divider(color: Color(0xffF4F4F4),),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Zipcode",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 21),),
              Text("${this.zipcode}",style: TextStyle(fontSize: 21),)
            ],
          ),
          Divider(color: Color(0xffF4F4F4),),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
                  onPressed: () {  },
                  child: Icon(Icons.add),
                  backgroundColor:Color(0xffAF0917),
                ),
    );
  }
}