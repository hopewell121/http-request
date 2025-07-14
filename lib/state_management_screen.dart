import 'package:flutter/material.dart';
import 'package:http_app/model/user_model.dart';

class StateUserDetails extends StatelessWidget {
  final UserModel user;
  const StateUserDetails({super.key, required this.user});

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
            SizedBox(height: 5,),
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
            
             
                
                ListTile(
              leading: Icon(Icons.home_filled),
              title: RichText(text: TextSpan(
                style: TextStyle(color: const Color.fromARGB(255, 35, 35, 35)),
                children: [
              TextSpan(text: 'Company Address: \n ', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
              TextSpan( text: user.company!.name.toString(), style: TextStyle(fontStyle: FontStyle.italic))
              ])),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.company!.catchPhrase.toString(), style: TextStyle(fontStyle: FontStyle.italic)),
                  Text(user.company!.bs.toString(), style: TextStyle(fontStyle: FontStyle.italic))

                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),

             ListTile(
              leading: Icon(Icons.location_on),
              title: RichText(text: TextSpan(
                style: TextStyle(color: const Color.fromARGB(255, 51, 50, 50)),
                children: [
                  TextSpan(text: 'Address: \n', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                  TextSpan(text: 'Street: ${user.address!.street.toString()}', style: TextStyle(fontStyle: FontStyle.italic))
                ]
              )),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('suit: ${user.address!.suite.toString()}',  style: TextStyle(fontStyle: FontStyle.italic)),
                  Text('City:${user.address!.city.toString()}', style: TextStyle(fontStyle: FontStyle.italic)),
                  Text('ZipCode: ${user.address!.zipcode.toString()}', style: TextStyle(fontStyle: FontStyle.italic)),
                  Text('Lat: ${user.address!.geo!.lat.toString()}', style: TextStyle(fontStyle: FontStyle.italic)),
                  Text('Lng: ${user.address!.geo!.lng.toString()}', style: TextStyle(fontStyle: FontStyle.italic)),
                 
                   

                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
           
           
          ],
        ),
      ),
    );
  }
}