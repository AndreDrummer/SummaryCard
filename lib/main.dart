import 'package:flutter/material.dart';
import 'package:summary/features/views/sumary_card.dart';

import 'bidings.dart';

Future<void> main() async {
  initializeDependencies();
  runApp(SummaryApp());
}

class SummaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SummaryCard(title: 'Flutter Demo Home Page'),
    );
  }
}
