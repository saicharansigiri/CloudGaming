import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  final String isSignIn = "signed in";
  final String isSignUp = "signed up";
  final String noUserOnEmail = "user-not-found";
  final String wrongPassword = "wrong-password";
  final String noDataError = "noDataError";
  final String weakPassword = "weak-password";
  final String emailExists = "email-already-in-use";

  Stream<User?> get authStateChanges => auth.authStateChanges();
  //sign in
  Future<String> signIn(String _email, String _password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      return isSignIn;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return noUserOnEmail;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return wrongPassword;
      }
    }
    return noDataError;
  }

  //sign up
  Future<String> signUp(String _email, String _password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      return isSignUp;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return weakPassword;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return emailExists;
      }
    } catch (e) {
      print(e);
    }
    return noDataError;
  }

  //sign out
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  //sign in with fb
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final AccessToken result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  Future<UserCredential> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final TwitterLogin twitterLogin = new TwitterLogin(
      consumerKey: '<your consumer key>',
      consumerSecret: ' <your consumer secret>',
    );

    // Trigger the sign-in flow
    final TwitterLoginResult loginResult = await twitterLogin.authorize();

    // Get the Logged In session
    final TwitterSession twitterSession = loginResult.session;

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: twitterSession.token,
      secret: twitterSession.secret,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(twitterAuthCredential);
  }
}
