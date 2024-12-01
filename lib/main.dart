import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracklab/locator.dart';
import 'package:tracklab/src/blocs/auth/auth_bloc.dart';
import 'package:tracklab/src/helpers/auth_validator.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Track Lab',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: "mon"),
        home: const AuthValidator(),
      ),
    );
  }
}
