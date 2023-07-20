import 'package:flutter/widgets.dart';

import '../pages/authpage/auth_page.dart';
import '../pages/noteshomepage/notes_home_page.dart';
import '../pages/reset_password_page/reset_password_page.dart';
import '../pages/verify_email_page/verify_email_page.dart';

Map<String, Widget Function(BuildContext)> routess = <String, WidgetBuilder>{
  '/verify/': (context) => const VerifiedPage(),
  '/reset/': (context) => const PasswordResetPage(),
  '/home/': (context) => const NotesHomePage(),
  '/auth/': (context) => const AuthPage(),
};
