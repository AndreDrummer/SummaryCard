import 'dart:convert';

import 'package:get/get.dart';
import 'package:summary/core/data/storage_manager.dart';
import 'package:summary/features/models/wealth_summary_model.dart';
import 'package:summary/features/services/summary_service.dart';

class SummaryController extends GetxController {
  final SummaryService summaryService = Get.find();
  final summaryList = <WealthSummary>[].obs;
  final loading = false.obs;

  Future<void> initSummaryCard() async {
    if (summaryList.isEmpty) {
      // if is offline
      // TODO: Implement connection state
      summaryList(
        json.decode(
          await StorageManager.readContent(),
        ),
      );
    } else {
      await loadSummaryList();
    }
  }

  Future<void> loadSummaryList() async {
    loading(true);
    summaryList(await summaryService.getWealthSummaryList());
    loading(false);
  }
}
