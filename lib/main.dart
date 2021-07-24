import 'package:flutter/material.dart';
import 'package:summary/features/views/sumary_card_screen.dart';
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
        debugShowCheckedModeBanner: false,
        home: SummaryCardScreen(),
      ),
    );
  }
}
