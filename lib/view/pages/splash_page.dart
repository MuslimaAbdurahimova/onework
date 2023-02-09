import 'package:flutter/material.dart';
import 'package:onework/view/pages/register_page.dart';

import '../../domen/service/local_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkToken();
    super.initState();
  }

  checkToken() async {
    if (await LocalStore.getAccessToken() == null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const SignUp()), (route) => false);
      // if (LocalStore.getOnBoarding() == null) {
      //   // go OnBoarding
      // } else {
      //   // go sign up
      // }
    } else {
      // go Home
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
