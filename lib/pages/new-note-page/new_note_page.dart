import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  String _title = 'Untitled';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text(_title),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset("assets/icons/menu_linear.svg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      maxLines: null,
                      textInputAction: TextInputAction.newline,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: _title,
                        hintStyle: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff898A8D)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
