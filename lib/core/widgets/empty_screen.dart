import 'package:flutter/material.dart';
import 'package:summary/core/constants/assets_path.dart';
import 'package:summary/core/constants/strings.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    Key? key,
    required this.hasInternetConnection,
  }) : super(key: key);

  final bool hasInternetConnection;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            hasInternetConnection
                ? AssetsPath.nothingFound
                : AssetsPath.noInternet,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            hasInternetConnection
                ? GeneralStrings.nothingFound
                : GeneralStrings.noInternetConnection,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ],
      ),
    );
  }
}
