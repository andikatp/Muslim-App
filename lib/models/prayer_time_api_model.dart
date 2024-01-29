import 'package:jadwal_solat/core/utils/typedef.dart';

class PrayerData {
  PrayerData({this.status, this.value});

  PrayerData.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool;
    value =
        json['data'] != null ? Value.fromMap(json['data'] as ResultMap) : null;
  }
  bool? status;
  Value? value;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (value != null) {
      data['data'] = value!.toJson();
    }
    return data;
  }
}

class Value {
  Value({this.id, this.lokasi, this.daerah, this.koordinat, this.jadwal});

  Value.fromMap(Map<String, dynamic> json) {
    id = json['id'] as String?;
    lokasi = json['lokasi'] as String?;
    daerah = json['daerah'] as String?;
    koordinat = json['koordinat'] != null
        ? Koordinat.fromMap(json['koordinat'] as ResultMap)
        : null;
    jadwal = json['jadwal'] != null
        ? Jadwal.fromJson(json['jadwal'] as ResultMap)
        : null;
  }
  String? id;
  String? lokasi;
  String? daerah;
  Koordinat? koordinat;
  Jadwal? jadwal;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['lokasi'] = lokasi;
    data['daerah'] = daerah;
    if (koordinat != null) {
      data['koordinat'] = koordinat!.toJson();
    }
    if (jadwal != null) {
      data['jadwal'] = jadwal!.toJson();
    }
    return data;
  }
}

class Koordinat {
  Koordinat({this.lat, this.lon, this.lintang, this.bujur});

  Koordinat.fromMap(Map<String, dynamic> json) {
    lat = json['lat'] as double?;
    lon = json['lon'] as double?;
    lintang = json['lintang'] as String?;
    bujur = json['bujur'] as String?;
  }
  double? lat;
  double? lon;
  String? lintang;
  String? bujur;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    data['lintang'] = lintang;
    data['bujur'] = bujur;
    return data;
  }
}

class Jadwal {
  Jadwal({
    this.tanggal,
    this.imsak,
    this.subuh,
    this.terbit,
    this.dhuha,
    this.dzuhur,
    this.ashar,
    this.maghrib,
    this.isya,
    this.date,
  });

  Jadwal.fromJson(Map<String, dynamic> json) {
    tanggal = json['tanggal'] as String?;
    imsak = json['imsak'] as String?;
    subuh = json['subuh'] as String?;
    terbit = json['terbit'] as String?;
    dhuha = json['dhuha'] as String?;
    dzuhur = json['dzuhur'] as String?;
    ashar = json['ashar'] as String?;
    maghrib = json['maghrib'] as String?;
    isya = json['isya'] as String?;
    date = json['date'] as String?;
  }
  String? tanggal;
  String? imsak;
  String? subuh;
  String? terbit;
  String? dhuha;
  String? dzuhur;
  String? ashar;
  String? maghrib;
  String? isya;
  String? date;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tanggal'] = tanggal;
    data['imsak'] = imsak;
    data['subuh'] = subuh;
    data['terbit'] = terbit;
    data['dhuha'] = dhuha;
    data['dzuhur'] = dzuhur;
    data['ashar'] = ashar;
    data['maghrib'] = maghrib;
    data['isya'] = isya;
    data['date'] = date;
    return data;
  }
}
