import 'package:flutter/material.dart';
import 'package:onework/domen/repository/auth_repo.dart';
import 'package:provider/provider.dart';

import 'controller/auth_controller.dart';
import 'view/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthController()),
      ],
      child: MaterialApp(
          title: 'One Work',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashPage()),
    );
  }
}
