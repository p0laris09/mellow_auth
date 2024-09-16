import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add content to the drawer here
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors
                  .blueGrey[100], // Set the background color of the header
            ),
            child: Center(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20, // Set the background color of the CircleAvatar
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: Colors.blueGrey[900],
                  ), // Customize the icon color
                ), // Adjust the radius to control the size of the CircleAvatar
              ),
            ),
          ),
          ListTile(
            title: const Text('Shared Space'),
            onTap: () {
              //Handles Press
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              //Handles Press
            },
          ),
        ],
      ),
    );
  }
}
