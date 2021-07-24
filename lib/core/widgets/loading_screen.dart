import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:summary/core/constants/strings.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
    this.loadingText,
    this.show = false,
  }) : super(key: key);
  final String? loadingText;
  final bool show;

  @override
  Widget build(BuildContext context) {
    return !show
        ? Container()
        : Container(
            color: Colors.black.withAlpha(200),
            alignment: Alignment.center,
            width: double.infinity,
            height: Get.height,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 48.0.h),
                    width: Get.width / 4,
                    height: Get.width / 4,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 0.5,
                    ),
                  ),
                  Text(
                    loadingText ?? GeneralStrings.loading,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                  )
                ],
              ),
            ),
          );
  }
}
