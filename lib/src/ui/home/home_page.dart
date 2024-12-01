import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tracklab/src/models/user_model.dart';
import 'package:tracklab/utils/urls.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.token});
  final String token;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<User?> getUser() async {
    try {
      final dio = Dio();
      final response = await dio.get(
          AppUrls.BASE_URL + AppUrls.USER + AppUrls.PROFILE,
          options: Options(headers: {'x-auth-token': widget.token}));
      print(response.data["user"]);
      final s = response.data["user"];
      return User.fromJson(s);
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.token);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: FutureBuilder<User?>(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.green)),
            );
          }
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Name: ${snapshot.data!.name}'),
                  Text('Email: ${snapshot.data!.email}'),
                  Text('Status: ${snapshot.data!.status}'),
                ],
              ),
            );
          }
          return const Center(
            child: Text('An error occurred. Please try again later'),
          );
        },
      ),
    );
  }
}
