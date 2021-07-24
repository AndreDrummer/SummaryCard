import 'package:flutter/material.dart';
import 'package:summary/core/widgets/empty_screen.dart';

class ConditionalWidgetRender extends StatelessWidget {
  const ConditionalWidgetRender({
    Key? key,
    this.isToRenderChild = false,
    required this.child,
  }) : super(key: key);

  final bool isToRenderChild;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isToRenderChild ? child : EmptyScreen();
  }
}
