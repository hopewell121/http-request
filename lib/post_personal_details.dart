import 'package:flutter/material.dart';
import 'package:http_app/model/post_user_model.dart';

class PostPersonalDetails extends StatelessWidget {
  final PostUserModel user;
  const PostPersonalDetails({
    super.key,
    required this.user
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.purpleAccent,
        title: Text('Post User Details', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [
             Text('Account', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
             SizedBox(height: 30,),
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
            Text('USER ID ${user.userId}'),
            SizedBox(height: 30,),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(user.title!),
              trailing: Text(user.id.toString()),
              
            ),
            Text('Body', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 26),),
            Text(user.body!, style: TextStyle( fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}