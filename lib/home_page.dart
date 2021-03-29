import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/dashboard/dashboard_page.dart';
import 'package:provider/provider.dart';
import 'components/rounded_buttons.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("My Cantor.",
                    style: GoogleFonts.poppins(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    )),
                Image.asset('assets/image1.png'),
                Text(
                  "Best way to invest Your Money!",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.08,
                ),
                RoundedButton(
                  text: 'Login',
                  onPress: () {
                    (firebaseUser == null)
                        ? Navigator.pushNamed(context, '/login')
                        : Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                            return Dashboard(firebaseUser);
                          }));
                  },
                  color: Colors.lightBlue[800],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RoundedButton(
                  text: 'Sign Up',
                  onPress: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  color: Colors.blueGrey[50],
                  textColor: Colors.black,
                ),
              ],
            ),
          ),
        ));
  }
}
