import 'package:get/get.dart';
import 'package:summary/core/shared/abstract_biding.dart';
import 'package:summary/features/controller/summary_controller.dart';
import 'package:summary/features/services/summary_service.dart';

class SummaryBidings implements Biding {
  @override
  void init() {
    Get.lazyPut(() => SummaryController());
    Get.lazyPut(() => SummaryService());
  }
}
