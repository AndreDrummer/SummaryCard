import 'package:get/get.dart';
import 'package:summary/core/shared/app_connectivity.dart';
import 'package:summary/features/summary_biding.dart';

void initializeDependencies() {
  Get.lazyPut(() => AppConnectivityController());

  var bindings = [
    SummaryBidings(),
  ];

  bindings.forEach((element) {
    element.init();
  });
}

void initServices() {
  final AppConnectivityController appConnectivityController = Get.find();
  appConnectivityController.liveCheckInternetConnection();
}
