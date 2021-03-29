import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/auth/auth_services.dart';
import 'package:login/components/rounded_buttons.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                    height: size.height * 0.26,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image3.png'),
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: RichText(
                      text: TextSpan(
                          text: 'Create Account',
                          style: GoogleFonts.poppins(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: '\nJoin Our Community',
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
                      vertical: 5,
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
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.person_outline_outlined,
                                      color: Colors.lightBlue[700],
                                      size: 22,
                                    ),
                                    hintText: 'Name',
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
                          height: 15,
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
                                      Icons.email_outlined,
                                      color: Colors.lightBlue[700],
                                      size: 22,
                                    ),
                                    hintText: 'Email address',
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
                          height: 15,
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
                                  controller: _phoneController,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.phone_android,
                                      color: Colors.lightBlue[700],
                                      size: 22,
                                    ),
                                    hintText: 'Phone number',
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.black45,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
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
                          height: 15,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        RoundedButton(
                          text: 'Sign Up',
                          onPress: () {
                            createUser();
                            Navigator.pushNamed(context, '/login');
                          },
                          color: Colors.lightBlue[700],
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "I'am already a member. ",
                              style: GoogleFonts.poppins(),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                "Login",
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

  void createUser() async {
    dynamic result = await AuthServices.register(
      _nameController.text,
      _emailController.text,
      _passwordController.text,
      _phoneController.text,
    );
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
      _emailController.clear();
      _passwordController.clear();
    }
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
