import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magnify/main.dart';

const users = const {
  'rahul_raj@example.com': 'abc123',
  'a@a.com': 'aaaa',
};

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 5000);

  Future<String> _authUser(LoginData data) {
    print('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return buildFlutterLoginWidget(inputBorder, context);
  }

  FlutterLogin buildFlutterLoginWidget(
      BorderRadius inputBorder, BuildContext context) {
    return FlutterLogin(
      title: 'Magnify',
      logo: 'assets/magnify_logo.png',
      onLogin: _authUser,
      onSignup: _authUser,
      theme: LoginTheme(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        errorColor: Colors.red,
        titleStyle:
            GoogleFonts.signika(fontSize: 50, fontWeight: FontWeight.w600),
        bodyStyle: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: TextStyle(
          color: Colors.white,
          shadows: [Shadow(color: Colors.grey, blurRadius: 2)],
        ),
        buttonStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.brown,
        ),
        cardTheme: CardTheme(
          color: Colors.brown,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(
            backgroundColor: Colors.brown,
            color: Colors.white,
          ),
          labelStyle: TextStyle(
            fontSize: 12,
            color: Colors.white54,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey.shade700, width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey.shade400, width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.brown, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5),
            borderRadius: inputBorder,
          ),
        ),
      ),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
