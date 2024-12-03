import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Text('welcome to home')
      ),
    );
  }
  
}