import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class Data extends StatefulWidget {
   int? id;
   Data({super.key,
    required this.id
   });
  @override
  _DataState createState() => _DataState();
}

List<Post> posts = [];

class _DataState extends State<Data> {

  getPost() async {
    try {
      var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "posts"));

    if(response.statusCode == 200){
      
      var jsondata = jsonDecode(response.body);

      for (var i in jsondata) {
        Post post = Post(i['id'], i['title'], i['body']);
        posts.add(post);
       }
    }
    else{
           showDialog(
                context: context,
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
    return posts;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: FutureBuilder(
                future: getPost(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: null,
                        strokeWidth: 7.0,
                      ),
                    );
                  } else
                    return ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text(posts[index].id.toString(),style:TextStyle(
                              color: posts[index].id.toString() == widget.id.toString() ? Color(0xffE43228):Colors.grey
                            ) ,),
                            title: Text(posts[index].title.toString(),style:TextStyle(
                              color: posts[index].id.toString() == widget.id.toString() ? Color(0xffE43228):Colors.black
                            ) ),
                            subtitle: Text(posts[index].body.toString(),style:TextStyle(
                              color: posts[index].id.toString() == widget.id.toString() ? Colors.black:Colors.grey
                            ) ),
                          );
                        });
                }
                )
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {  },
                  child: Icon(Icons.add),
                  backgroundColor:Color(0xffAF0917),
                ),
                );
  }
}

class Post {
  int? id;
  String? title;
  String? body;
  Post(this.id, this.title, this.body);
}