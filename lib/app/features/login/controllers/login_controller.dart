import 'package:fmarket/app/config/routes/app_pages.dart';
import 'package:fmarket/app/service/data.service.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

class Token {
  String? accessToken;

  Token({required this.accessToken});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
  }
}

final box = GetStorage();

class LoginController extends GetxController {
  login(String phone, String password) async {
    final doc = await loginRef(phone, password);
    final data = Token.fromJson(doc.data);
    final token = data.accessToken;
    await box.write('token', token);
    Get.toNamed(Routes.dashboard);
  }
}
