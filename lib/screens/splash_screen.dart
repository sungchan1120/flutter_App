import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.getBool('isLogin') ?? false;
    print("[*] isLogin : " + isLogin.toString());
    return isLogin;
  }

  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => ListScreen())));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => LoginScreen())));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      moveScreen();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SplashScreen',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '나만의 일정관리 : TODO 리스트 앱',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:async';


// import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreen extends State<SplashScreen> {
//   Future<bool> checkLogin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isLogin = prefs.getBool('isLogin') ?? false;
//     print('[*] isLogin : ' + isLogin.toString());
//     return isLogin;
//   }

//   void moveScreen() async {
//     checkLogin().then((isLogin) {
//       if (isLogin) {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => ListScreen(),
//           ),
//         );
//       } else {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => LoginScreen(),
//           ),
//         );
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 2), () {
//       moveScreen();
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Splashscreen',
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               '나만의 일정관리: TODO 리스트앱',
//               style: TextStyle(fontSize: 20),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
