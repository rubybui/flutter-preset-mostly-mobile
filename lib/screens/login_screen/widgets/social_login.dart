import 'dart:developer';
import 'dart:io';
import 'package:universal_platform/universal_platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:friends/services/social_auth_service.dart';
import 'package:friends/utilities/auth_handler.dart';
import 'package:friends/utilities/enum.dart';
import 'package:friends/utilities/router.dart';
import 'package:friends/widgets/fp_button.dart';

class SocialLogin extends ConsumerWidget {
  const SocialLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double sizeW = MediaQuery.of(context).size.width / 100;

    void handleSocialLogin(AuthResultStatus status) {
      EasyLoading.dismiss();
      if (status == AuthResultStatus.successful) {
      } else if (status == AuthResultStatus.cancelled) {
        //
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: (() => Navigator.pop(context)),
                child: AlertDialog(
                  title: const Center(
                    child: Text('Failed'),
                  ),
                  content: Text(
                    AuthExceptionHandler.generateExceptionMessage(status),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            });
      }
    }

    Future<void> redirectOnLogin() async {
      // Fetch user data from backend if needed
      ref.read(routerProvider).go("/home/dashboard");
    }

    Future<AuthResultStatus> signInWithGoogle() async {
      final AuthResultStatus result = await AuthService(ref).googleSignIn();

      if (result == AuthResultStatus.successful) {
        await redirectOnLogin();
      }
      handleSocialLogin(result);

      return result;
    }

    Future<AuthResultStatus> signInWithApple() async {
      log("apple sign in");
      final AuthResultStatus result = await AuthService(ref).appleSignIn();

      log(result.toString());

      if (result == AuthResultStatus.successful) {
        await redirectOnLogin();
      }
      handleSocialLogin(result);
      return result;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: SizedBox(
        width: UniversalPlatform.isIOS ? sizeW * 60 : sizeW * 40,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FpButton(
              title: "Google Login",
              onPressed: () async {
                await signInWithGoogle();
              },
            ),
            if (UniversalPlatform.isIOS)
              FpButton(
                title: "Apple Login",
                onPressed: () async {
                  await signInWithApple();
                },
              ),
          ],
        ),
      ),
    );
  }
}
