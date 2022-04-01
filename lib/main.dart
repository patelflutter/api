import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  getApiData()async{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    Response respons =await get(url);
    print(respons.statusCode);
    if(respons.statusCode ==200){
      print("Success");
      final data = jsonDecode(respons.body);
      print(data);
    }else{
      print("OOPS Something Wrong");
    }
  }
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Hello"),
            SizedBox(height: 30,),
            ElevatedButton(onPressed:getApiData(), child: Text("Click Me"))
          ],
        ),
      ),
    );
  }
}


