import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summary/core/widgets/loading_screen.dart';
import 'package:summary/features/controller/summary_controller.dart';

class SummaryCard extends StatelessWidget {
  SummaryCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  final SummaryController summaryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          Center(
            child: Obx(
              () => Text(
                '${summaryController.summaryList.map((item) => item.toJson())}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          LoadingScreen(
            show: summaryController.loading.value,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => summaryController.loadSummaryList(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
