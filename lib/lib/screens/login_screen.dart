import 'package:flutter/material.dart';
import 'package:purple/resources/auth_methods.dart';
import 'package:purple/responsive/mobile_screen_layout.dart';
import 'package:purple/responsive/responsive_layout.dart';
import 'package:purple/responsive/web_screen_layout.dart';
import 'package:purple/screens/signup_screen.dart';
import 'package:purple/utils/global_variables.dart';
import 'package:purple/utils/utils.dart';
import 'package:purple/widgets/text_field_input.dart';
//import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
          (route) => false);

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

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
          child: Column(
            children: [
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
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff85488A),
                    ),
                  )),
              const SizedBox(height: 49.17),
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 23),
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(height: 150),
              InkWell(
                onTap: loginUser,
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
                  child: Positioned(
                    top: 10,
                    bottom: 90,
                    left: 96,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: !_isLoading
                            ? const Text(
                                'Continue',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                ),
                              )
                            : const CircularProgressIndicator(
                                color: Colors.white,
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
                      'Dont have an account?',
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    ),
                    child: Container(
                      child: const Text(
                        ' Signup.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
