// ignore_for_file: prefer_const_constructors

import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/text_field.dart';
import 'package:chatapp/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //sign Up
  void signUp() async{
      if(passwordController.text != confirmPasswordController.text){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Passwords do not match!, try Again!!",
            ),
          ),
        );
        return;
      }
      else{
        final authService = Provider.of<AuthService>(context , listen: false);
        try{
          await authService.signUpWithEmailandPassword(
              emailController.text,
              passwordController.text,
          );
        } catch (e){
               ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                   content: Text(e.toString(),
                   ),
                 ),
               );
        }
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
                  Icons.message,
                  size: 80,
                ),
                //create account
                Text(
                  "Let's Create an Account for you!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 50),

                // Email Textfield
                MyTextField(
                  controller: emailController,
                  hintText: "Enter Email ID",
                  obscureText: false,
                ),
                //password
                const SizedBox(height: 10),

                MyTextField(
                  controller: passwordController,
                  hintText: "Enter Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                //confirm password
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                //sign up button
                const SizedBox(height: 25),
                MyButton(text: "Sign Up", onTap: signUp),
                //sign up
                const SizedBox(height: 25),
                Row(
                  children: [
                   const Text("Already a member?"),
                    const SizedBox(width: 4,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Login Now",
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
