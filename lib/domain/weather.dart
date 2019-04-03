import 'dart:core';

class Weather {
  int id;
  double temperature;
  double pressure;
  double humidity;
  DateTime dateTime;

  Weather(this.id, this.temperature, this.pressure, this.humidity);

  Weather.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        temperature = json["temperature"],
        pressure = json["pressure"],
        humidity = json["humidity"],
        dateTime = DateTime.parse(json["date"]).toLocal();
}
