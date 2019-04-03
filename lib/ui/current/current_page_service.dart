import 'package:dio/dio.dart';
import 'package:home_track/core/core_api.dart';
import 'package:home_track/domain/weather.dart';

class CurrentPageService extends CoreApi {
  Future<Weather> getLatestDateEntry() async {
    Response response = await apiProvider.get("/api/log");
    if (response.statusCode == 200) {
      return Weather.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
