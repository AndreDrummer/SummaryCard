import 'package:summary/features/summary_biding.dart';

void initializeDependencies() {
  var bindings = [
    SummaryBidings(),
  ];

  bindings.forEach((element) {
    element.init();
  });
}
