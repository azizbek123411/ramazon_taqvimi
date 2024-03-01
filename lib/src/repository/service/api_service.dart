import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:ramazon_taqvimi/src/repository/models/namoz_model.dart';
import 'package:ramazon_taqvimi/src/repository/models/pray_model.dart';

class ApiService {
  static const String base = "islomapi.uz";

  //https://islomapi.uz/api/monthly?region=Toshkent&month=4

  static resultPath({
    required String city,

  }) {
    final Uri uri =
        Uri.parse("https://islomapi.uz/api/present/day?region=$city");
    return uri;
  }

  // static Future<List<PrayModel>> getData({
  //   required String city,
  //   required int month,
  // }) async {
  //   List<PrayModel> getTimes = [];
  //   final response = await get(
  //     resultPath(city: city, month: month),
  //   );
  //   log(response.body);
  //   if (response.statusCode == 200) {
  //     final dataList = jsonDecode(response.body);
  //     for (final item in dataList) {
  //       try {
  //         getTimes.add(PrayModel.fromJson(item));
  //       } catch (e, st) {
  //         log("Error", error: e, stackTrace: st);
  //       }
  //     }
  //   }
  //   log(response.body);
  //   return getTimes;
  // }

static Future<PrayModel?> getData({
  required String city,
}) async {
  // List<NamozModel> getTimes = [];
  final response = await get(resultPath(city: city,));
  log(response.body);
  if (response.statusCode == 200) {
    final dataList = jsonDecode(response.body);
    return PrayModel.fromJson(dataList);
  }
  log(response.body);
  return null;
}
}
