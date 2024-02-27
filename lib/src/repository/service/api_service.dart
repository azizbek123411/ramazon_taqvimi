import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:ramazon_taqvimi/src/repository/models/namoz_model.dart';

class ApiService {

  static const String base = "islomapi.uz";

  static resultPath({
    required String city,
  }) {
    final Uri uri=Uri.parse("https://islomapi.uz/api/present/day?region=$city");
    return uri;
  }

  static Future getData({
    required String city,
  }) async {
    List  getTimes=[];
    final response = await get(resultPath(city: city));
    log(response.body);
    if (response.statusCode == 200) {
      final dataList=jsonDecode(response.body);
      for(final item in dataList){
        try{
          getTimes.add(NamozModel.fromJson(item));
        }catch(e,st){
          log("Error",error: e,stackTrace: st);
        }
      }
    }
    log(response.body);
    return getTimes;
  }
}
