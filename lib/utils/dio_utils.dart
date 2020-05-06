import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// https://github.com/xiedong11/flutter_app/blob/master/lib/pages/network/utils/dio_utils.dart
class DioUtils {
  static final String baseUrl = "http://localhost:3030"; //base url
  static DioUtils _instance;
  Dio _dio;
  BaseOptions _baseOptions;

  static DioUtils getInstance() {
    if (_instance == null) {
      _instance = new DioUtils();
    }
    return _instance;
  }

  /// dio初始化配置
  DioUtils() {
    //請求參數配置
    _baseOptions = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {},
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    //創建dio實例
    _dio = new Dio(_baseOptions);
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: false,
        requestBody: false,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: false,
        maxWidth: 90,
      ),
    ); //可根據項目需要選擇性的添加請求攔截器
//    _dio.interceptors.add(
//      InterceptorsWrapper(onRequest: (RequestOptions requestions) async {
//        //此处可网络请求之前做相关配置，比如会所有请求添加token，或者userId
//        requestions.queryParameters["token"] = "testtoken123443423";
//        requestions.queryParameters["userId"] = "123456";
//        return requestions;
//      }, onResponse: (Response response) {
//        //此處攔截工作在數據返回之後，可在此對dio請求的數據做二次封裝或轉實體類等相關操作
//        return response;
//      }, onError: (DioError error) {
//        //處理錯誤請求
//        return error;
//      }),
//    );
  }

  /// get请求
  get(url, {queryParameters, options}) async {
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: queryParameters, options: options);
    } on DioError catch (e) {}

    return response.toString();
  }

  /// Post请求
  post(url, {queryParameters, options}) async {
    Response response;
    try {
      response = await _dio.post(url,
          queryParameters: queryParameters, options: options);
      print('post result ---${response.data}');
    } on DioError catch (e) {}

    return response.toString();
  }
}
