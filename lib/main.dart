import 'package:flutter/material.dart';
import 'package:practica_flutter/screens/pageMainScreen.dart';
import 'package:practica_flutter/screens/pageSecondScreen.dart';
import 'package:practica_flutter/screens/pageThirdScreen.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginIn(),
    );
  }
}

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
      appBar: AppBar(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Home :D',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.play_arrow),
            icon: Icon(Icons.play_circle),
            label: 'Videos',
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
      body: Container(
        child: _isLoggedIn
            ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Image.network(_userObj.photoUrl!),
              const SizedBox(height: 20,),
              Text(_userObj.displayName!),
              const SizedBox(height: 20,),
              Text(_userObj.email),
              const SizedBox(height: 20,),
              MaterialButton(
                onPressed: () {
                  _googleSignIn.signOut().then((value) {
                    setState(() {
                      _isLoggedIn = false;
                    });
                  }).catchError((e) {});
                },
                height: 50,
                minWidth: 100,
                color: Colors.red,
                child: const Text('Logout',style: TextStyle(color: Colors.white),),
              )
          ],
        ),
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
          )
        ),
      ),
    );
  }
}