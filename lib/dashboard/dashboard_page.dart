import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/auth/auth_services.dart';

class Dashboard extends StatefulWidget {
  final FirebaseUser user;

  Dashboard(this.user);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.lightBlue[800],
            size: 20,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.settings,
                        color: Colors.black45,
                        size: 18,
                      ),
                      onPressed: null,
                    ),
                    Text(
                      'Settings',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuItem(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.black45,
                        size: 18,
                      ),
                      onPressed: () async {
                        await AuthServices.signOut();
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                    GestureDetector(
                      onTap: () async {
                        await AuthServices.signOut();
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text(
                        'Sign Out',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            child: IconButton(
                icon: Icon(
                  Icons.miscellaneous_services_rounded,
                  color: Colors.lightBlue[800],
                  size: 24,
                ),
                onPressed: null),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: _size.height,
            width: double.infinity,
            color: Colors.transparent,
          ),
          Positioned(
            top: _size.height * 0.16,
            child: Container(
              height: _size.height,
              width: _size.width,
              decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  )),
            ),
          ),
          Positioned(
            top: _size.height * 0.09,
            left: (_size.width / 2) - 80,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1,
                      offset: Offset(1, 1),
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/image4.png'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Positioned(
            top: _size.height * 0.35,
            left: 20,
            right: 20,
            child: Column(
              children: [
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
                        width: _size.width,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: Colors.lightBlue[800],
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    widget.user.email,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
