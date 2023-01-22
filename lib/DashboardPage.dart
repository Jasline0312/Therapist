import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:therapist/controllers/FirebaseAuthService.dart';
import 'package:therapist/custom_app_bar.dart';
import 'package:therapist/login_page.dart';

import 'controllers/firestore_controller.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  String? username;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsernameFromFirestore();
  }

  Future<void> getUsernameFromFirestore() async {
    String? tempUsername = await FirestoreController.getUsername();
    setState(() {
      username = tempUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/background_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Dashboard'
            ),
            username != null ? Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 20),
                child: Text(
                  'Hi, $username',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ) : Container(),
            FirebaseAuth.instance.currentUser == null ? TextButton(
              child: const Text('Login'),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context){
                      return const LoginPage();
                    }
                  )
                );
              },
            ) : TextButton(
              child: const Text('Log out'),
              onPressed: () async {
                await FirebaseAuthService.signOut(context);
                await getUsernameFromFirestore();
                // if you want
                MaterialPageRoute(
                    builder: (context){
                      return const LoginPage();
                    }
                );
              },
            ),
          ],
        ),
      ),
    ),
    );
  }
}
