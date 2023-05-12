import 'package:data/service/apiService.dart';
import 'package:flutter/material.dart';

import 'data_list_view.dart';
import 'model/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        body: Text("hello"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App"),),
      body: FutureBuilder(
        future:  ApiService().getData(),
        builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot){
          if(snapshot.hasData){
            return NewsListView(data: snapshot.data!);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}