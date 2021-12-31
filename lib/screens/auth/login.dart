import 'package:flutter/material.dart';
import 'package:simbiotik_test/controller/auth/auth_with_social.dart';
import 'package:simbiotik_test/widgets/auth/sign_with_google_btn.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  googleSignIn() {

    // SocialAuth.signOut();
    SocialAuth.signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FlutterLogo(
              size: 70,
            ),
            const SizedBox(
              height: 30,
            ),
            SignInWithGoogleBtn(
              onTap: googleSignIn,
            ),
          ],
        ),
      ))),
    );
  }
}
