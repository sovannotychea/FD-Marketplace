import 'package:dio/dio.dart';

var dio = Dio();

loginRef(String phone, String password) async {
  try {
    Dio()
        .interceptors
        .add(LogInterceptor(requestHeader: true, requestBody: true));
    return await Dio().post("http://localhost:5000/auth",
        data: {"username": phone, "password": password});
  } on DioError catch (e) {
    print(e.response?.data);
    print(e.error);
  }
}
