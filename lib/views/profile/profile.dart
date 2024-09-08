import 'package:flutter/material.dart';
import 'package:kasama_towers_lodge/components/kalubtn.dart';
import 'package:kasama_towers_lodge/components/profile_details_tile.dart';
import 'package:kasama_towers_lodge/utils/colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Karas.primary,
        foregroundColor: Colors.white,
        title: Text('Profile'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.settings))
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Karas.primary,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100), bottomRight: Radius.circular(100))
                  ),
                ),
                Positioned(
                   bottom: -50,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(80),
                            image: DecorationImage(image: AssetImage('assets/avatar.webp')),
                            border: Border.all(width: 4, color: Colors.white),
                            boxShadow: [
                              BoxShadow()
                            ]
                          ),
                        ),
                      ),
                    )
                ),

              ],
            ),
          ),
          SizedBox(height: 60,),
          Container(
            child: Column(
              children: [
                Text('Kaluba Chakanga', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                Text('Client', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
              ],
            ),
          ),
          SizedBox(height: 40,),
          ProfileDetailsTile(
              title: 'Email',
              subtitle: 'kalubachakanga@gmail.com',
              icon: Icon(Icons.email, size: 20, color: Colors.grey,),
          ),
          ProfileDetailsTile(
              title: 'Phone Number',
              subtitle: '0962407441',
              icon: Icon(Icons.phone_android, size: 20, color: Colors.grey,),
          ),
          Spacer(),
          Container(
             padding: EdgeInsets.all(40),
              child: Kalubtn(
                  label: 'Log out',
                  onclick: (){},
                  backgroundColor: Karas.action,
                  height: 45,
                borderRadius: 40,
              )
          )
        ],
      ),
    );
  }
}
