import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:therapist/MainPage.dart';

import 'controllers/FirebaseAuthService.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Future<String?> onLogin(LoginData data) async {
    return await FirebaseAuthService.signIn(context, data.name, data.password);
  }

  Future<String?> onSignUp(SignupData data) async {
    String? username = data.additionalSignupData!['Username'];
    return await FirebaseAuthService.register(context, username!, data.name!, data.password!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FlutterLogin(
          initialAuthMode: AuthMode.login,
          title: 'Therepist',
          // logo: AssetImage("lib/assets/logo/logo.png"),
          hideForgotPasswordButton: true,
          messages: LoginMessages(

          ),
          theme: LoginTheme(
            primaryColor: const Color(0xFFf48b33),
            accentColor: const Color(0xFFf48b33),
            pageColorLight: const Color(0xFFf7f6ae),
            pageColorDark: const Color(0xFFf7f6ae),
            titleStyle: const TextStyle(
                color: Color(0xFFf48b33),
                fontFamily: 'ahronbd',
                fontWeight: FontWeight.w500,
                fontSize: 40
            ),
          ),
          onLogin: onLogin,
          onSignup: onSignUp,
          onRecoverPassword: (String passwordString) {  },
          onSubmitAnimationCompleted: (){
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(
                  builder: (_) => const MainPage()
              )
            );
          },
          additionalSignupFields: [
            UserFormField(
                keyName: 'Username',
                icon: Icon(Icons.person),
                displayName: 'Username',
                userType: LoginUserType.name,
                fieldValidator: (value){
                  if(value == ''){
                    return 'Username cannot be empty';
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
