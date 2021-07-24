import 'package:flutter/material.dart';
import 'package:summary/core/constants/assets_path.dart';
import 'package:summary/core/constants/strings.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsPath.nothingFound,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            GeneralStrings.nothingFound,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
