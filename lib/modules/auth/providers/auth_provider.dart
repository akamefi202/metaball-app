import 'package:flutter/material.dart';

class LoginRedirect {
  const LoginRedirect({required this.path, this.extra});

  final String path;
  final Object? extra;
}

class AuthProvider with ChangeNotifier {}
