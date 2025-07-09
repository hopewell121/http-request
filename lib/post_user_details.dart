import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/model/post_user_model.dart';
import 'package:http_app/post_personal_details.dart';

class PostUserDetails extends StatefulWidget {
  const PostUserDetails({super.key});

  @override
  State<PostUserDetails> createState() => _PostUserDetailsState();
}

class _PostUserDetailsState extends State<PostUserDetails> {
  late Future<List<PostUserModel>>postUserDataList;

   @override
  void initState() {
    super.initState();
    postUserDataList = getData();
    
  }

  Future <List<PostUserModel>> getData()async{

    final String url ='https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(url),
    
    headers: {'Content-Type': 'application/json'} );
    
   if (response.statusCode==200){
    List<dynamic> body = jsonDecode(response.body);
    List<PostUserModel> data = body.map((e)=> PostUserModel.fromJson(e)).toList();
    return data;

   }else {
    print('The status code is ${response.statusCode}');
    throw Exception('Failed to load data');
   }

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text('Post User details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  hintText: 'Ask Meta AI or Search',
                  prefixIcon: Image.asset('images/003-circle.png'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
               ),
SizedBox(height: 30,),
               FutureBuilder(
                future: postUserDataList,
                 builder: (context, snapshot){
           if (snapshot.hasData){
            
            final List<PostUserModel> users= snapshot.data!;
            return Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index){
                  final user= users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('images/image3.jpeg'),
                    ),
                    trailing:  Text(user.id.toString()),
                    title: Text(user.title!),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PostPersonalDetails(user: user)));
                    },
                  );
                }));
           }
           return ListTile();
                 }),

          
          ],
        ),
      ),
    );
  }
}