import 'package:flutter/material.dart';

class HomeDemo extends StatefulWidget {
  final String username;

  const HomeDemo({Key key, this.username}) : super(key: key);
  @override
  _HomeDemoState createState() => _HomeDemoState();
}

class _HomeDemoState extends State<HomeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Text(widget.username),
    );
  }
}
