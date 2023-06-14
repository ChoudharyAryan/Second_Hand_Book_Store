import 'package:a_s_c/constants/features/auth/services/auth_service.dart';
import 'package:a_s_c/constants/features/auth/widgets/common_widgets/custom_button.dart';
import 'package:a_s_c/constants/features/auth/widgets/common_widgets/custom_textfield.dart';
import 'package:a_s_c/enums/auth_enum.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  late final TextEditingController _emailcontroller;
  late final TextEditingController _passwordcontroller;
  late final TextEditingController _namecontroller;

  final AuthService authService = AuthService();

  @override
  void initState() {
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
    _namecontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
      name: _namecontroller.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      email: _emailcontroller.text,
      password: _passwordcontroller.text,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create or Login to your Account'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18)),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets
            .only(
              top: 25, 
              left: 8, 
              right: 8,
              ),
            child: Column(
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  tileColor:
                      _auth == Auth.signup ? 
                      Colors.deepPurple : Colors.white,
                  title: Text(
                    'Create account',
                    style: TextStyle(
                      color: _auth == Auth.signup
                          ? Colors.white
                          : Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Radio(
                    activeColor: Colors.white,
                    value: Auth.signup,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signup)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            CustomTextfield(
                              controller: _namecontroller,
                              hinttext: 'Username',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextfield(
                              controller: _emailcontroller,
                              hinttext: 'Email',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextfield(
                              controller: _passwordcontroller,
                              hinttext: 'Password',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              bname: 'Create account',
                              onpressed: () {
                                if (_signUpFormKey.currentState!.validate()) {
                                  signUpUser();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  tileColor:
                      _auth == Auth.signin ? 
                      Colors.deepPurple : Colors.white,
                  title: Text(
                    'Login.',
                    style: TextStyle(
                      color: _auth == Auth.signin
                          ? Colors.white
                          : Colors.deepPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  leading: Radio(
                    activeColor: Colors.white,
                    value: Auth.signin,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signin)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            CustomTextfield(
                              controller: _emailcontroller,
                              hinttext: 'Email',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextfield(
                              controller: _passwordcontroller,
                              hinttext: 'Password',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              bname: 'Login',
                              onpressed: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  signInUser();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
