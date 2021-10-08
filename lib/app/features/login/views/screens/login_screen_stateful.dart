import 'package:flutter/material.dart';
import 'package:fmarket/app/features/login/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:fmarket/app/config/routes/app_pages.dart';

class LoginScreenStateFull extends StatefulWidget {
  LoginScreenStateFull({Key? key}) : super(key: key);

  @override
  _nameState createState() => _nameState();
}

class _nameState extends State<LoginScreenStateFull> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  LoginController login = Get.put(LoginController());

  final phone = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _onPressLogin(String phone, String password) {
    login.login(phone, password);
  }

  @override
  Widget build(BuildContext context) {
    final phoneField = TextField(
      controller: phone,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Phone Number",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      controller: password,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _onPressLogin(phone.text, password.text);
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/images/raster/ic_launcher.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                phoneField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
