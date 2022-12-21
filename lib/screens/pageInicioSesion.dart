import 'package:flutter/material.dart';
import 'package:practica_flutter/screens/pageMainScreen.dart';
import 'package:practica_flutter/screens/pageSecondScreen.dart';
import 'package:practica_flutter/screens/pageThirdScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Listas',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.play_arrow),
            icon: Icon(Icons.play_circle),
            label: 'Video',
          ),
        ],
      ),
      body: <Widget>[
        const MyMainPage(),
        const PageSecond(),
        const VideoPlayerScreen(),
      ][currentPageIndex],
    );
  }
}


class LoginIn extends StatefulWidget {
  LoginIn({Key? key}) : super(key: key);

  @override
  State<LoginIn> createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoggedIn = false;
  late GoogleSignInAccount _userObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Royer"),
        ),
      body: Container(
        child: _isLoggedIn
            ? const Center(
              child: NavigationExample(),
            ) : Center(
          child: MaterialButton(
            onPressed: () {
              _googleSignIn.signIn().then((userData) {
                setState(() {
                  _isLoggedIn = true;
                  _userObj = userData!;
                });
              }).catchError((e) {
                print(e);
              });
            },
            height: 50,
            minWidth: 100,
            color: Colors.red,
            child: const Text('Google Signin',style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
