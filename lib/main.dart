import 'package:a_s_c/constants/features/auth/screens/auth_screen.dart';
import 'package:a_s_c/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'A_S_C_Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(
            primary: Colors.deepPurple
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
          )),
          onGenerateRoute: (settings) => 
          generateRoute(settings),
      home: const AuthScreen(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text('A_S_C'),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18)),
            ),
          ),
          body:  Center(
            child: CupertinoButton(
              child: const Text('A'), 
              onPressed: (){
                Navigator.pushNamed(context, AuthScreen.routeName);
                },
                ),
          ),
    );
  }
}

