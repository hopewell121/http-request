import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_app/model/user_model.dart';
import 'package:http_app/post_user_details.dart';
import 'package:http_app/provider/user_provider.dart';
import 'package:http_app/state_management_screen.dart';
import 'package:http_app/user_details.dart';
import 'package:provider/provider.dart';

class HomeStateManagement extends StatefulWidget {
  const HomeStateManagement({super.key});

  @override
  State<HomeStateManagement> createState() => _HomeStateManagementState();
}

class _HomeStateManagementState extends State<HomeStateManagement> {
  // method to get the data from jason
  

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    await context.read<UserProvider>().getData();

    
  }


  @override
  
  Widget build(BuildContext context) {
    final userDataList = context.watch<UserProvider>().userinfo;

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

         

          Expanded(
            child: ListView.builder(
              itemCount: userDataList.length,
              itemBuilder: (context, index){
                final user= userDataList[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StateUserDetails(user: user) ));
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/image3.jpeg'),
                  ),
                  title: Text(user.name!),
                  subtitle: Text(user.username!),
                  trailing: Text(user.id.toString()),
                );
              }),
          )
          ],
        ),
      ),
    );
  }
}