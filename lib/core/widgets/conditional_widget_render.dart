import 'package:flutter/material.dart';
import 'package:summary/core/widgets/empty_screen.dart';

class ConditionalWidgetRender extends StatelessWidget {
  const ConditionalWidgetRender({
    Key? key,
    required this.whenInternetConnection,
    required this.hasInternetConnection,
    this.isToRenderChild = false,
    required this.child,
  }) : super(key: key);

  final Function whenInternetConnection;
  final bool hasInternetConnection;
  final bool isToRenderChild;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (isToRenderChild)
      return child;
    else if (hasInternetConnection) {
      whenInternetConnection();
      return Center(child: CircularProgressIndicator());
    }
    return EmptyScreen(hasInternetConnection: hasInternetConnection);
  }
}
