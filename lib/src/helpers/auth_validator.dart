import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracklab/src/ui/home/home_page.dart';
import 'package:tracklab/src/ui/landing_page.dart';

class AuthValidator extends StatefulWidget {
  const AuthValidator({super.key});

  @override
  State<AuthValidator> createState() => _AuthValidatorState();
}

class _AuthValidatorState extends State<AuthValidator> {
  Future<String> checkAuth() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token != null) {
        return token;
      }
      return "";
    }catch(err){
      print(err);
      return ""; 
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: checkAuth(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data != "" ) {
            return  HomePage(token: snapshot.data!,);
          } else {
            return const LandingPage();
          }
        }
        return const LandingPage();
      },
    );
  }
}