// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/text_field.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
  required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //Log In
  void signIn() async{
    //get the auth service
    final authService = Provider.of<AuthService>(context,listen: false);
    try{
      await authService.signInWithEmailandPassword(
          emailController.text,
          passwordController.text,
      );
    }
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString(),),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                const SizedBox(height: 50),

                Icon(
                  Icons.message_rounded,
                  size: 80,
                ),
                //welcomeback
                    Text(
            "Welcome back!",
            style: TextStyle(
              fontSize: 16,
            ),
                    ),
                const SizedBox(height: 50),

                // Email Textfield
                MyTextField(
                    controller: emailController,
                    hintText: "Email",
                    obscureText: false,
                ),
                //password
                const SizedBox(height: 10),

                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                //sign in button
                const SizedBox(height: 25),
                MyButton(text: "Log in", onTap: signIn),
                //sign up
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text("Not a member?"),
                    const SizedBox(width: 4,),
                   GestureDetector(
                     onTap: widget.onTap,
                     child: Text(
                       "Register Now",
                       style: TextStyle(fontWeight: FontWeight.bold),
                     ),
                   ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
