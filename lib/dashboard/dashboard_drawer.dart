import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.lightBlueAccent,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30,bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/sup.jpg'),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Text("Muhammad Ahmad",style: TextStyle(fontSize: 22,color: Colors.white70),),
                  Text("imats.322@gmail.com",style: TextStyle(color: Colors.white70),),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile",style: TextStyle(fontSize: 18),),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings",style: TextStyle(fontSize: 18),),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout",style: TextStyle(fontSize: 18),),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
