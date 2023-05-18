import 'package:flutter/widgets.dart';
import 'package:yournotes/pages/home_page.dart';
import 'package:yournotes/pages/notes_main_view.dart';
import 'package:yournotes/pages/profile_view.dart';
import 'package:yournotes/pages/verified_view.dart';

Map<String, Widget Function(BuildContext)> routess = <String, WidgetBuilder>{
  '/verify/': (context) => const VerifiedPage(),
  '/home/': (context) => const NotesHomePage(),
  '/profile/': (context) => const ProfilePage(),
   '/main/': (context) => const HomePage(), 
};
