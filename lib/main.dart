import 'package:flutter/material.dart';
import 'package:miftahprint/screens/homepage.dart';
import 'package:miftahprint/screens/memo.dart';
import 'package:miftahprint/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

//ctrl alt ; -> emoji
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          AppRoutes.memo: (context) => const Memo(),
        });
  }
}
