import 'package:summary/core/widgets/conditional_widget_render.dart';
import 'package:summary/features/controller/summary_controller.dart';
import 'package:summary/features/widgets/summary_card.dart';
import 'package:summary/core/shared/app_connectivity.dart';
import 'package:summary/core/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryCardScreen extends StatefulWidget {
  SummaryCardScreen({
    Key? key,
  }) : super(key: key);

  @override
  _SummaryCardScreenState createState() => _SummaryCardScreenState();
}

class _SummaryCardScreenState extends State<SummaryCardScreen> {
  final SummaryController summaryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFE8EBF6),
      body: FutureBuilder(
        future: summaryController.initSummaryCard(),
        builder: (context, snapshot) {
          return Obx(
            () => ConditionalWidgetRender(
              whenInternetConnection: () => summaryController.initSummaryCard(),
              hasInternetConnection: summaryController.connectionStatus !=
                  ConnectivityStatus.noConnection,
              isToRenderChild: summaryController.summaryList.isNotEmpty &&
                  snapshot.connectionState == ConnectionState.done,
              child: Stack(
                children: [
                  Center(
                    child: SummaryCard(
                      wealthSummary: summaryController.summaryList,
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
