import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/login_page.dart';

import 'MainPage.dart';
import 'controllers/FirebaseAuthService.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController usernameTextEditController = TextEditingController();
  TextEditingController emailTextEditController = TextEditingController();
  TextEditingController passwordTextEditController = TextEditingController();

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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(
                  'lib/assets/signup.png',
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
                        'Username',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextField(
                        controller: usernameTextEditController,
                        decoration: const InputDecoration(
                            hintText: 'Enter your username'
                        ),
                      ),
                      const SizedBox(height: 30),
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
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          child: Image.asset(
                            'lib/assets/sign_up_button.png',
                            height: 50,
                            width: 200,
                          ),
                          onPressed: () async {
                            if(usernameTextEditController.text.isNotEmpty && emailTextEditController.text.isNotEmpty && passwordTextEditController.text.isNotEmpty){
                              String? result = await FirebaseAuthService.register(context, usernameTextEditController.text, emailTextEditController.text, passwordTextEditController.text);

                              if(result != null){
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(result))
                                );
                              }else{
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

                    Center(
                      child:TextButton(
                          onPressed: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                        builder: (context) =>
                        const LoginPage()),
                  );
          },
                      child: const Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 15, color: Color.fromRGBO(247,129,90,50),),
            ),
          ),
                    ),
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
}
