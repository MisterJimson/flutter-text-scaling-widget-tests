import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String text;

  const MyApp({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(text: text),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.text}) : super(key: key);

  final String text;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 298,
              height: 17,
              child: Row(
                children: <Widget>[
                  Text(
                    widget.text,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
