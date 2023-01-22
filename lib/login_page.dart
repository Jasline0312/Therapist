import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/sign_up_page.dart';

import 'MainPage.dart';
import 'controllers/FirebaseAuthService.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailTextEditController = TextEditingController();
  TextEditingController passwordTextEditController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Navigate to MainPage if user already logged in
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(FirebaseAuth.instance.currentUser != null){
        Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
                builder: (_) => const MainPage()
            )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/background_image.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'lib/assets/login.png',
                  height: 250,
                ),
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height / 1.7,
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextField(
                        controller: emailTextEditController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your email'
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextField(
                        controller: passwordTextEditController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Enter your password'
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          child: Image.asset(
                            'lib/assets/login_button.png',
                            height: 50,
                            width: 200,
                          ),
                          onPressed: () async {
                            if(emailTextEditController.text.isNotEmpty && passwordTextEditController.text.isNotEmpty){
                              showLoadingDialog();
                              String? result = await FirebaseAuthService.signIn(context, emailTextEditController.text, passwordTextEditController.text);

                              if(result != null){
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(result))
                                );
                              }else{
                                Navigator.of(context).pop();
                                Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (_) => const MainPage()
                                  )
                                );
                              }
                            }
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          child: Image.asset(
                            'lib/assets/sign_up_button.png',
                            height: 50,
                            width: 200,
                          ),
                          onPressed: (){
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (_) => const SignUpPage()
                                )
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    ),
    );
  }

  Future showLoadingDialog() async {
    await showDialog(
      context: context,
      builder: (_){
        return SizedBox(
          height: 30,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}
