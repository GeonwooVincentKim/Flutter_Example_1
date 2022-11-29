import 'package:flutter/material.dart';
import 'package:flutter_application_1_1/navigation/router/sub_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Flutter App",
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/subpage': (context) => const SubPage(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'image/flutter_logo.png',
            fit: BoxFit.fill,
          )
        )
      ),
    );
  }
}
