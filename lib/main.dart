import 'package:flutter/material.dart';
import 'package:newlivestock/pages/homepage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newlivestock/providers/cow_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
