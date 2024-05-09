import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task_craft/bootstrap.dart';

Future<String?> signInWithGoogle() async {
  await GoogleSignIn().signOut();
  final GoogleSignInAccount? googleUser = await GoogleSignIn(
    serverClientId: '287218143583-1hjqp1au1a6ra8gj6gdn1766m73r0k0q.apps.googleusercontent.com',
  ).signIn();

  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;


  logger.d(googleAuth?.idToken);

  return googleAuth?.idToken;
}

Future<bool> signOutFromGoogle() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } on Exception catch (_) {
    return false;
  }
}
