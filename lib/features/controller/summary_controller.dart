import 'dart:convert';

import 'package:get/get.dart';
import 'package:summary/core/data/storage_manager.dart';
import 'package:summary/core/shared/app_connectivity.dart';
import 'package:summary/features/models/wealth_summary_model.dart';
import 'package:summary/features/services/summary_service.dart';

class SummaryController extends GetxController {
  final AppConnectivityController appConnectivityController = Get.find();
  final SummaryService summaryService = Get.find();

  ConnectivityStatus get connectionStatus =>
      appConnectivityController.connectivity.value;

  final summaryList = <WealthSummary>[].obs;
  final loading = false.obs;

  Future<void> initSummaryCard() async {
    if (connectionStatus == ConnectivityStatus.noConnection) {
      loading(true);
      final storageData = await StorageManager.readContent();
      summaryList(List<WealthSummary>.from(
        json.decode(storageData).map((item) => WealthSummary.fromJson(item)),
      ));
      loading(false);
    } else {
      await loadSummaryList();
    }
  }

  Future<void> loadSummaryList() async {
    loading(true);
    final list = await summaryService.getWealthSummaryList();
    await StorageManager.writeContent(
      json.encode(list.map((e) => e.toJson()).toList()),
    );
    summaryList(list);
    loading(false);
  }
}
