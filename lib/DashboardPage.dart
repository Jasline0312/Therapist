import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/controllers/FirebaseAuthService.dart';
import 'package:therapist/login_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          children: [
            FirebaseAuth.instance.currentUser == null ? TextButton(
              child: const Text('Login'),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_){
                      return const LoginPage();
                    }
                  )
                );
              },
            ) : Container(),
            TextButton(
              child: Text('Log out'),
              onPressed: (){
                FirebaseAuthService.signOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
