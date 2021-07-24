import 'package:flutter/material.dart';
import 'package:summary/features/views/sumary_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bidings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  initServices();
  runApp(SummaryApp());
}

class SummaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 592),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SummaryCard(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
