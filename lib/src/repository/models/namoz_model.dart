
class NamozModel {
  String region;
  DateTime date;
  String weekday;
  HijriDate hijri_date;
  Times times;

  NamozModel(
      {required this.region,
      required this.date,
      required this.weekday,
      required this.hijri_date,
      required this.times,});

  factory NamozModel.fromJson(Map<String, dynamic> json) {
    HijriDate hijri_date = HijriDate.fromJson(json["hijri_date"]);
    Times times = Times.fromJson(json["times"]);
    return NamozModel(
        region: json['region'],
        date: DateTime.parse(json['date']),
        weekday: json['weekday'],
        hijri_date: hijri_date,
        times: times,);
  }
  Map<String,dynamic>toJson(){
    Map<String,dynamic> data=<String,dynamic>{};
    data["region"]=region;
    data["date"]=date;
    data["weekday"]=weekday;
    data["hijri_date"]=hijri_date;
    data["times"]=times;
    return data;
  }
}

class HijriDate {
  String month;
  int day;

  HijriDate({
    required this.month,
    required this.day,
  });

  factory HijriDate.fromJson(Map<String, dynamic> json) {
    return HijriDate(month: json['month'], day: json['day']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["month"] = month;
    data["day"] = day;
    return data;
  }
}

class Times {
  String tong_saharlik;
  String quyosh;
  String peshin;
  String asr;
  String shom_iftor;
  String hufton;

  Times(
      {required this.tong_saharlik,
      required this.quyosh,
      required this.peshin,
      required this.asr,
      required this.shom_iftor,
      required this.hufton});

  factory Times.fromJson(Map<String, dynamic> json) {
    return Times(
      tong_saharlik: json["tong_saharlik"],
      quyosh: json["quyosh"],
      peshin: json["peshin"],
      asr: json["asr"],
      shom_iftor: json["shom_iftor"],
      hufton: json["hufton"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data["tong_saharlik"] = tong_saharlik;
    data["quyosh"] = quyosh;
    data["peshin"] = peshin;
    data["shom_iftor"] = shom_iftor;
    data["hufton"] = hufton;
    return data;
  }
}
