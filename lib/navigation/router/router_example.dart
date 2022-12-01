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
      onGenerateRoute: (RouteSettings settings){
        final List<String> pathElements = settings.name!.split("/");
        if(pathElements[0] != '') return null;
        if(pathElements[1] == 'subpage'){
          String subPageId = pathElements[2];

          // return MaterialPageRoute(
            // builder: (BuildContext context) => SubPageDetail(subPageId: subPageId),
          // );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        print(settings);
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
        child: GestureDetector(
          onTap:() {
            Navigator.pushNamed(context, "/subpage");
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'image/flutter_logo.png',
              fit: BoxFit.fill,
            )
          )
        )
      ),
    );
  }
}
