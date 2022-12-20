import 'package:dio/dio.dart';

class ApiClient{

  ApiClient(){
    _init();
  }

  late Dio dio;

  _init(){
    dio = Dio(
      BaseOptions(
        baseUrl: "https://third-exam.free.mockoapp.net",
        connectTimeout: 25000,
        receiveTimeout: 20000,
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(
        onError: (DioError error, ErrorInterceptorHandler handler){
          print("ERRORga TUSHDI");
          return handler.next(error);
        },
        onRequest: (RequestOptions requestOptions,RequestInterceptorHandler handler){
          print("SO'ROV YUBORILDI");
          String currentLocale = "uz";
          requestOptions.headers["Accept"] = "application/json";
          requestOptions.headers["Accept-Language"] =
          currentLocale.isEmpty ? "ru" : currentLocale;
          return  handler.next(requestOptions);
        },
        onResponse: (Response response,ResponseInterceptorHandler handler ){
          print("URAAA RESPONSE KELDI");
          return handler.next(response);
        }
    ));
  }

}