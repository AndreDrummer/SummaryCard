import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

enum ConnectivityStatus {
  MobileConnection,
  WiFiConnection,
  noConnection,
}

class AppConnectivityController extends GetxController {
  final Rx<ConnectivityStatus> connectivity =
      ConnectivityStatus.noConnection.obs;

  void liveCheckInternetConnection() {
    Connectivity().onConnectivityChanged.listen(_defineConnectionStatus);
  }

  ConnectivityStatus _defineConnectionStatus(
      ConnectivityResult connectivityResult) {
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        connectivity(ConnectivityStatus.MobileConnection);
        return ConnectivityStatus.MobileConnection;
      case ConnectivityResult.wifi:
        connectivity(ConnectivityStatus.WiFiConnection);
        return ConnectivityStatus.WiFiConnection;
      case ConnectivityResult.none:
        connectivity(ConnectivityStatus.noConnection);
        return ConnectivityStatus.noConnection;
    }
  }
}
