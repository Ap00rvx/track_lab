import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tracklab/locator.dart';
import 'package:tracklab/src/models/user_model.dart';
import 'package:tracklab/src/resources/home/home_repository.dart';
import 'package:tracklab/src/ui/home/organisation/org_space.dart';
import 'package:tracklab/utils/urls.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.token});
  final String token;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(widget.token);
    return FutureBuilder<User?>(
      future: locator.get<HomeRepository>().getUser(widget.token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Container(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.green)),
                    ),
                    Text("Fetching details..."),
                  ],
                ),
              ),
            ),
          );
        }
        if (snapshot.hasData) {
          return const OrgSpace();
        }
        return const Scaffold(
          body: Center(
            child: Text('An error occurred. Please try again later :)'),
          ),
        );
      },
    );
  }
}
