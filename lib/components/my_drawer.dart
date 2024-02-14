// ignore_for_file: prefer_const_constructors
import 'package:chatapp/pages/settings_page.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: Theme.of(context).colorScheme.tertiary,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.message_rounded,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,top: 25),
            child: ListTile(
              title: const Text("H O M E"),
              leading: const Icon(
                Icons.home,
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,top: 25),
            child: ListTile(
              title: const Text("S E T T I N G S"),
              leading:const Icon(
                  Icons.settings,
              ),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
