import 'package:flutter/material.dart';
import 'package:chucknorris/screen/joke.dart';
import 'package:chucknorris/helpers/swatch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Swatch.colorScheme()),
      title: 'Chuck Norris Jokes',
      home: const Scaffold(backgroundColor: Color(0xFFffffff), body: Joke()),
    );
  }
}
