import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../screens/splash_page.dart';
import 'screens/home_screen.dart';
import 'screens/nav_screen.dart';

// class MyApp extends StatelessWidget {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(Duration(seconds: 5))
//         .then((value) => {FlutterNativeSplash.remove()});
//   }

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MainPage());
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(child,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
      title: 'Material App',
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        NavScreen.routeName: (context) => NavScreen(),
      },
      // home: NavScreen(),
      home: SplashPage(),
    );
  }
}

// void main() => runApp(MyApp());
// void main() {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   void initState() {
//     super.initState();

//     Future.delayed(Duration(seconds: 5))
//         .then((value) => {FlutterNativeSplash.remove()});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       builder: (context, child) => ResponsiveWrapper.builder(child,
//           minWidth: 480,
//           defaultScale: true,
//           breakpoints: [
//             ResponsiveBreakpoint.resize(480, name: MOBILE),
//             ResponsiveBreakpoint.autoScale(800, name: TABLET),
//             ResponsiveBreakpoint.resize(1000, name: DESKTOP),
//           ],
//           background: Container(color: Color(0xFFF5F5F5))),
//       title: 'Material App',
//       home: NavScreen(),
//     );
//   }
// }
