class PrayerData {
  PrayerData({this.status, this.value});

  PrayerData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    value = json['data'] != null ? Value.fromMap(json['data']) : null;
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
    id = json['id'];
    lokasi = json['lokasi'];
    daerah = json['daerah'];
    koordinat =
        json['koordinat'] != null ? Koordinat.fromMap(json['koordinat']) : null;
    jadwal = json['jadwal'] != null ? Jadwal.fromJson(json['jadwal']) : null;
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
    lat = json['lat'];
    lon = json['lon'];
    lintang = json['lintang'];
    bujur = json['bujur'];
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
    tanggal = json['tanggal'];
    imsak = json['imsak'];
    subuh = json['subuh'];
    terbit = json['terbit'];
    dhuha = json['dhuha'];
    dzuhur = json['dzuhur'];
    ashar = json['ashar'];
    maghrib = json['maghrib'];
    isya = json['isya'];
    date = json['date'];
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
