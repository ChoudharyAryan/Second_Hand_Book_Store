import 'package:a_s_c/constants/features/auth/screens/auth_screen.dart';
import 'package:a_s_c/constants/features/auth/services/auth_service.dart';
import 'package:a_s_c/constants/features/home/screens/home_screen.dart';
import 'package:a_s_c/providers/user_provider.dart';
import 'package:a_s_c/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
  providers: [ChangeNotifierProvider
  (create: (context) => UserProvider(),
  ),
  ],
  child: const MyApp()));
  }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) :super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'A_S_C_Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(primary: Colors.deepPurple),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
              centerTitle: true,
            )),
      onGenerateRoute: (settings) => generateRoute(settings),
      home:  Provider.of<UserProvider>(context).user.token.isNotEmpty? const HomeScreen() : const AuthScreen(),
    );
  }
}

