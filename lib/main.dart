import 'package:flutter/material.dart';
import 'package:flutter_slider_app/intro_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: IntroSlider(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Home Page title'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text('Homa page content'),
        ),
      ),
    );
  }
}
