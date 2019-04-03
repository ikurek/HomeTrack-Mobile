import 'package:async/async.dart';
import 'package:dio/dio.dart';

class CoreApi {
  Dio apiProvider;
  AsyncMemoizer asyncMemoizer;

  CoreApi() {
    BaseOptions apiOptions =
        BaseOptions(baseUrl: "https://ikurek.pl/hometrack");
    apiProvider = Dio(apiOptions);

    apiProvider.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions requestOptions) {
      requestOptions.headers["Authorization"] = "HomeTrackSuperSecretToken";
    }));

    apiProvider.interceptors.add(LogInterceptor(
        responseBody: true, requestHeader: true, requestBody: true));

    asyncMemoizer = AsyncMemoizer();
  }
}
