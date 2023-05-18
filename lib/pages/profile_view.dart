import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yournotes/pages/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final _greeting = Greetings().greeting;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/home/');
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
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 255, 197, 197),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 5))
                              ],
                              image: DecorationImage(
                                  image: AssetImage('assets/images/avatar.jpg'),
                                  fit: BoxFit.cover)),
                          height: 225.0,
                          width: 225.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 00),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Hi",
                              style: GoogleFonts.marcellus(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "$_greeting, ${Profile().getUsername}",
                              style: GoogleFonts.marcellus(
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(90, 100, 100, 100),
                            borderRadius: BorderRadius.all(
                              Radius.circular(45.0),
                            ),
                          ),
                          height: 50.0,
                          width: 250.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit_note,
                                  size: 32,
                                ),
                              ),
                              const Text(
                                "Edit Profile",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 199, 235, 179),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 5))
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                height: 200.0,
                                width: 175.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.assignment_add,
                                        size: 48,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        '12',
                                        style: GoogleFonts.rowdies(
                                          fontSize: 70,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        'Your Notes',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 213, 248),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 5))
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                height: 200.0,
                                width: 175.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.access_time_filled_rounded,
                                        size: 48,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        '03',
                                        style: GoogleFonts.rowdies(
                                          fontSize: 70,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        "Your Todo's",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 197, 197),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 5))
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                height: 200.0,
                                width: 175.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.favorite_rounded,
                                        size: 48,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        '06',
                                        style: GoogleFonts.rowdies(
                                          fontSize: 70,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Text(
                                        "Your Favourites",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(0xff111111),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 5))
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                height: 200.0,
                                width: 175.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete_forever_rounded,
                                        size: 48,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        '00',
                                        style: GoogleFonts.rowdies(
                                          color: Colors.white,
                                          fontSize: 70,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 25),
                                      child: Text(
                                        "Deleted Notes",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ActionChip(
                              label: const Text(
                                'Feedback',
                              ),
                              avatar: const Icon(Icons.email),
                              elevation: 2,
                              pressElevation: 10,
                              onPressed: () {},
                            ),
                            ActionChip(
                              label: const Text(
                                'Rate us',
                              ),
                              avatar: const Icon(Icons.star_half_outlined),
                              elevation: 2,
                              pressElevation: 10,
                              onPressed: () {},
                            ),
                            ActionChip(
                              label: const Text(
                                'Privacy Policy',
                              ),
                              avatar: const Icon(Icons.privacy_tip_sharp),
                              elevation: 2,
                              pressElevation: 10,
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        indent: 30,
                        endIndent: 30,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future _confirmExit() async {
    switch (await showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Your Notes'),
            content: const Text('Are you sure you want to Exit?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context, 'Yes');
                },
                child: const Text('Yes'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context, 'No');
                },
                child: const Text('No'),
              ),
            ],
          );
        })) {
      case 'Yes':
        FirebaseAuth.instance.signOut();
        Navigator.of(context).pushReplacementNamed('/main/');
        break;
      case 'No':
        break;
    }
  }
}

class Profile {
  late String username = 'User';
  set setUsername(String username) => this.username = username;
  get getUsername => username;
}
