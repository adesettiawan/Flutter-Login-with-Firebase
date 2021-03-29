import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/auth/auth_services.dart';
import 'package:login/components/rounded_buttons.dart';
import 'package:login/dashboard/dashboard_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height * 0.37,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image2.png'),
                        fit: BoxFit.contain,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 20,
                    child: RichText(
                      text: TextSpan(
                          text: 'Login',
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: '\nWelcome Back!',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: SafeArea(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.lightBlue[700],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(128, 128, 128, .3),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey[200]),
                                  ),
                                ),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person_outline_outlined,
                                      color: Colors.lightBlue[700],
                                      size: 22,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.black45,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(128, 128, 128, .3),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.grey[200]),
                                  ),
                                ),
                                child: TextField(
                                  controller: _passwordController,
                                  obscureText: _isHidden,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.lock_outline,
                                      color: Colors.lightBlue[700],
                                      size: 22,
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(
                                        (_isHidden)
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility,
                                        color: Colors.lightBlue[700],
                                        size: 20,
                                      ),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.black45,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: GoogleFonts.poppins(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.08,
                        ),
                        RoundedButton(
                          text: 'Login',
                          onPress: () {
                            (firebaseUser == null)
                                ? login()
                                : Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                    return Dashboard(firebaseUser);
                                  }));
                          },
                          color: Colors.lightBlue[700],
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "I'am a new user. ",
                              style: GoogleFonts.poppins(),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.poppins(
                                  color: Colors.lightBlue[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    dynamic result = await AuthServices.login(
        _emailController.text, _passwordController.text);
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
