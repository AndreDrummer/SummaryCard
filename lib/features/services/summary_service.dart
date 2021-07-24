import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:summary/core/shared/endpoints.dart';
import 'package:summary/core/constants/strings.dart';
import 'package:summary/core/shared/secret_key.dart';
import 'package:summary/features/models/wealth_summary_model.dart';
import 'package:summary/features/services/queries.dart';

class SummaryService extends GetConnect {
  final _dio = Dio();

  Future<List<WealthSummary>> getWealthSummaryList() async {
    try {
      final response = await _dio.post(
        Endpoints.baseUrl,
        data: json.encode({
          "query": Queries.wealthSummary,
        }),
        options: Options(
          headers: {
            'x-hasura-admin-secret': '$apiSecretKey',
          },
        ),
      );

      return List<WealthSummary>.from(
        response.data['data']['wealthSummary'].map(
          (item) => WealthSummary.fromJson(item),
        ),
      );
    } on Exception catch (err) {
      print('${ErrorsStrings.anErrorOccurred} $err');
      return <WealthSummary>[];
    }
  }
}
