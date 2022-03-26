import 'package:flutter/material.dart';
import 'package:purple/screens/login_screen.dart';
import 'package:purple/screens/signup_screen2.dart';
import 'package:purple/utils/global_variables.dart';
import 'package:purple/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fullnameController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: MediaQuery.of(context).size.width > webScreenSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(children: [
            Container(
                width: 400,
                height: 60,
                margin: const EdgeInsets.only(
                  left: 60,
                  right: 60,
                  top: 90,
                  bottom: 20,
                ),
                child: const Text(
                  'Welcome To Purple',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.8,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff85488A),
                  ),
                )),
            const SizedBox(height: 49.17),
            //input field for full name
            TextFieldInput(
              hintText: 'Enter your full name',
              textInputType: TextInputType.text,
              textEditingController: _fullnameController,
            ),
            const SizedBox(height: 23),
            //input field for username
            TextFieldInput(
              hintText: 'What would you like us to call you?',
              textInputType: TextInputType.text,
              textEditingController: _usernameController,
            ),
            const SizedBox(height: 23),
            //input field for email
            TextFieldInput(
              hintText: 'Enter your email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(height: 23),
            //input field for password
            TextFieldInput(
              hintText: 'Enter your password',
              textInputType: TextInputType.text,
              textEditingController: _passwordController,
              isPass: true,
            ),
            const SizedBox(height: 150),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SignUp2Screen()));
                }
              },
              child: Container(
                width: 257,
                height: 60,
                padding: const EdgeInsets.only(
                  left: 70,
                  right: 70,
                  top: 15.5,
                  bottom: 20,
                ),
                margin: const EdgeInsets.fromLTRB(0, 0, 20, 25),
                decoration: BoxDecoration(
                  color: const Color(0xff4fd7c3),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: const Positioned(
                  top: 10,
                  bottom: 90,
                  left: 96,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text(
                    'Already have an account?',
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
                  child: Container(
                    child: const Text(
                      ' Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
