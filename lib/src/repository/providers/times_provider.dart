
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ramazon_taqvimi/src/repository/models/mosque_model.dart';
import 'package:ramazon_taqvimi/src/repository/models/pray_model.dart';
import 'package:ramazon_taqvimi/src/repository/service/api_service.dart';

import '../../ui/pages/splash_page/time_location.dart';



final namozTimes = FutureProvider<List<PrayModel?>>((ref) async {
  return await ApiService.getData(city: TimeLocation.controller.text, month: DateTime.now().month,);
});
final mosqueProvider=FutureProvider<List<MosqueModel?>>((ref)async{
  return await ApiService.getMosques();
});




