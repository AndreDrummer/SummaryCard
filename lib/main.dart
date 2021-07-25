import 'package:summary/features/views/sumary_card_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
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
        theme: ThemeData(
          primaryColor: Color(
            0XFF3B5CB8,
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0.sp,
            ),
            bodyText1: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16.0.sp,
            ),
            button: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0.sp,
              color: Color(0XFF3B5CB8),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: SummaryCardScreen(),
      ),
    );
  }
}
