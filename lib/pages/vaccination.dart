import 'package:flutter/material.dart';
import 'package:newlivestock/models/cow.dart';

class Vaccination extends StatelessWidget {
  final String cowId;

  const Vaccination({Key? key, required this.cowId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination $cowId'),
        backgroundColor: const Color.fromRGBO(157, 208, 104, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is the details page for cow with ID: $cowId.',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
