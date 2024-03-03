import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramazon_taqvimi/src/repository/models/pray_model.dart';
import 'package:ramazon_taqvimi/src/repository/service/api_service.dart';

final namozTimes = FutureProvider<List<PrayModel?>>((ref) async {
  return await ApiService.getData(city: 'Toshkent', month: 3,);
});
