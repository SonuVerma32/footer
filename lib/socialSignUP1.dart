import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
FirebaseAuth auth = FirebaseAuth.instance;
final googleSignin = GoogleSignIn();
var user;
Future<User> googleSignUp()async{
  await Firebase.initializeApp();
  GoogleSignInAccount googleSignInAccount = await googleSignin.signIn();
  if(googleSignInAccount != null){
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken
    );
    var result = await auth.signInWithCredential(authCredential);
    user = auth.currentUser;
    print(user);
    return user;
  }

}

