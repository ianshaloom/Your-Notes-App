import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yournotes/pages/profilepage/widgets/confirm_signout.dart';

import '../../models/greetings.dart';
import 'widgets/summary_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final _greeting = Greetings().greeting;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_sharp),
            onPressed: _confirmExit,
            color: const Color.fromARGB(255, 0, 0, 0),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 255, 244, 236),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: size.width * 0.20,
              backgroundImage: const AssetImage('assets/images/avatar.jpg'),
            ),
            Text(
              "$_greeting, ${Profile().getUsername}",
              style: GoogleFonts.marcellus(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.black26,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Edit Your Profile',
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      SummaryTile(
                        icon: Icon(
                          Icons.assignment_add,
                          size: 48,
                        ),
                        numberOfItems: '12',
                        tittle: 'Your Notes',
                        color: Color.fromARGB(255, 199, 235, 179),
                      ),
                      SummaryTile(
                        icon: Icon(
                          Icons.access_time_filled_rounded,
                          size: 48,
                        ),
                        numberOfItems: '03',
                        tittle: "Your Todo's",
                        color: Color.fromARGB(255, 255, 213, 248),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      SummaryTile(
                        icon: Icon(
                          Icons.favorite_rounded,
                          size: 48,
                        ),
                        numberOfItems: '06',
                        tittle: "Your Favourites",
                        color: Color.fromARGB(255, 255, 197, 197),
                      ),
                      SummaryTile(
                        icon: Icon(
                          Icons.delete_forever_rounded,
                          size: 48,
                        ),
                        numberOfItems: '00',
                        tittle: "Deleted Notes",
                        color: Color(0xff111111),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future _confirmExit() async {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      context: context,
      builder: (context) => SignOutBottomSheet(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/auth/',
            (route) => false,
          );
        },
      ),
    );
  }
}

class Profile {
  late String username = 'User';
  set setUsername(String username) => this.username = username;
  get getUsername => username;
}
