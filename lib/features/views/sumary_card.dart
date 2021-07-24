import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summary/core/shared/app_connectivity.dart';
import 'package:summary/core/widgets/conditional_widget_render.dart';
import 'package:summary/core/widgets/loading_screen.dart';
import 'package:summary/features/controller/summary_controller.dart';

class SummaryCard extends StatefulWidget {
  SummaryCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _SummaryCardState createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  final SummaryController summaryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: summaryController.initSummaryCard(),
        builder: (context, snapshot) {
          return Obx(
            () => ConditionalWidgetRender(
              isToRenderChild: summaryController.connectionStatus !=
                      ConnectivityStatus.noConnection ||
                  summaryController.summaryList.isNotEmpty,
              child: Stack(
                children: [
                  Center(
                    child: Obx(
                      () => Text(
                        '${summaryController.summaryList.map((item) => item.toJson()).toList()}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  LoadingScreen(
                    show: summaryController.loading.value,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
