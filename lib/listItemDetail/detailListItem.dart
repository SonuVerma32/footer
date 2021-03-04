import 'package:flutter/material.dart';

class DetailListItem extends StatelessWidget {
  final int index;

  DetailListItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Reasoning"),
      ),
      body: Center(
        child: Text("Reasoning #$index"),
      ),
    );
  }
}
