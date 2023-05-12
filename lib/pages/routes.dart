import 'package:flutter/widgets.dart';
import 'package:yournotes/pages/login_view.dart';
import 'package:yournotes/pages/signup_view.dart';

Map<String, Widget Function(BuildContext)> routess =
    <String, WidgetBuilder>{'/login/':(context) => const LoginPage(),'/signup/':(context) => const SignupPage()};
