import 'package:chatapp/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text("S E T T I N G S",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(color : Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark Mode",
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.secondary),
            ),
            CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context , listen: false).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            ),
          ],
        ),
      ),
    );
  }
}
