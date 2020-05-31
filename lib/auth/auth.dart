import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



class AuthProvider {

  final FirebaseAuth _auth = FirebaseAuth.instance;



  Future<dynamic> signInWithEmail(String email, String password) async{

    try {

      AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);

      FirebaseUser user = result.user;

      return user;

    } catch (e) {

      print(e.message);

      return null;

    }

  }



  Future<void> logOut() async {

    try {

      await _auth.signOut();

    } catch (e) {

      print("error logging out");

    }

  }



  Future<dynamic> loginWithGoogle() async {

    try {

      GoogleSignIn googleSignIn = GoogleSignIn();

      GoogleSignInAccount account = await googleSignIn.signIn();

      if(account == null )

        return false;

      AuthResult res = await _auth.signInWithCredential(GoogleAuthProvider.getCredential(

        idToken: (await account.authentication).idToken,

        accessToken: (await account.authentication).accessToken,

      ));

      return res.user;

    } catch (e) {

      print(e.message);

      print("Error logging in with google");

      return null;

    }

  }

}