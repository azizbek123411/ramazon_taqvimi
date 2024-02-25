import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:ramazon_taqvimi/src/repository/models/namoz_model.dart';

///http://api.aladhan.com/v1/calendarByCity/2017/4?city=London&country=UnitedKingdom&method=2
class ApiService {
  static const String base = "api.aladhan.com";

  static String resultPath({
    required String city,
    required String country,
    required int month,
    required int year,
  }) {
    return "/v1/calendarByCity/year=$year/month=$month?city=$city&country=$country&method=2";
  }

  static Future<List<NamozModel>> getTimes({
    required String city,
    required String country,
    required int month,
    required int year,
  })async {
    List <NamozModel> getTimes=[];
    Uri uri =Uri.https(base,resultPath(city: city, month: month,country: country,year: year));
    final response=await get(uri);
    if(response.statusCode==200){
      final dataList=jsonDecode(response.body);
      for(final item in dataList){
        try{
          getTimes.add(NamozModel.fromJson(item));
        }catch(error,st){
          log("Error:",error: error,stackTrace: st);
        }
      }
    }
log(response.body);
    return getTimes;

  }
}
