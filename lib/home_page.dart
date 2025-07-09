import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/model/user_model.dart';
import 'package:http_app/post_user_details.dart';
import 'package:http_app/user_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // method to get the data from jason
  late Future<List<UserModel>>userDataList;

  @override
  void initState() {
    super.initState();
    userDataList = getData();
  }

  Future <List<UserModel>> getData()async{

    final String url ='https://jsonplaceholder.typicode.com/users';
    var response = await http.get(Uri.parse(url), 
    
    headers:{'Content-Type': 'application/json',} );


    if (response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      List<UserModel> data = body.map((e) => UserModel.fromJson(e)).toList();
   return data;
    //  print(response.body);

    } else {
      print('The status code is ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        // backgroundColor: Colors.white,
        title:  Text('Whatsapp', style: TextStyle(color: const Color.fromARGB(255, 4, 164, 87), fontSize: 30, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Image.asset('images/001-camera.png')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PostUserDetails()));
            }, icon: Image.asset('images/002-option.png')),
          )
        ],
      ),
      // body: FutureBuilder(
      //         future: userDataList, 
      //         builder: (context, snapshot){
      //         if(snapshot.hasData){
      // final List<UserModel> users = snapshot.data!;
      // return ListView.builder(
      //   itemCount: users.length,
      //   itemBuilder: (context, index){
      //     final user = users[index];
      //     return Padding(
      //       padding: const EdgeInsets.all(12),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           CircleAvatar(),
      //           Text(user.name!),
      //           Text(user.username!),
      //         ],
      //       ),
      //     );
          
      //   },
      //   );
      //         }
      //         return ListTile(
              
      //         );
      //       })

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
           Padding(
             padding: const EdgeInsets.symmetric( vertical: 10),
             child: TextFormField(
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
           ),
           SizedBox(height: 10,),
        
           Row(
            spacing: 10,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 104, 243, 109)
                ),
                child: Text('All'),
              ),
                               
                              
                               Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 230, 229, 229)
                ),
                child: Text('Unread'),
              ),
              
                              
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 230, 229, 229)
                ),
                child: Text('Groups'),
              ),
            ],
           ),

         

          FutureBuilder(
              future: userDataList, 
              builder: (context, snapshot){
              if(snapshot.hasData){
      final List<UserModel> users = snapshot.data!;
      return Expanded(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
            final user = users[index];
            return ListTile(
              leading: CircleAvatar(
                
                backgroundImage: AssetImage('images/boy.png'),
              ),
              title: Text(user.name!),
              subtitle: Text('@${user.username}', style: TextStyle(),),
              trailing: Text('16:20'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetails(user: user)));
              },
            );
            
          },
          ),
      );
              }
              return ListTile(
              
              );
            })
         
          ],
        ),
      ),
    );
  }
}