import 'package:flutter/material.dart';
import 'package:http_app/model/user_model.dart';

class UserDetails extends StatelessWidget {
  final UserModel user;
  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
    title: Text('USER DETALS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              
            ),
            Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/boy.png'),
                 
                  radius: 60,
                  
                ),
                Positioned(
           right: 5,
           bottom: 5,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: Icon(Icons.camera_alt_outlined),
            )),

              ],
            ),
            SizedBox(height: 15,),
            Text(user.name!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Text(user.email!, style: TextStyle( fontStyle: FontStyle.italic),),
            // Container(
            //   width: 250,
            //   height: 1,
            //   color: Colors.black,
            // )
            SizedBox(height: 30,),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('@${user.username}'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.call),
              title: Text(user.phone!),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(user.email!),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: Icon(Icons.public),
              title: Text(user.website!),
              trailing: Icon(Icons.arrow_forward_ios),
            ),

          ],
        ),
      ),
    );
  }
}