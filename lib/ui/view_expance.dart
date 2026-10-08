import 'package:flutter/material.dart';

class view_expance extends StatefulWidget {
  const view_expance({super.key});

  @override
  State<view_expance> createState() => _view_explanceState();
}

class _view_explanceState extends State<view_expance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("hii",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}


