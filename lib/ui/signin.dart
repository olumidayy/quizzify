import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import './../auth/auth.dart';
// import 'home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email, password;

  AuthProvider auth = AuthProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[900],
        body: SafeArea(
          child: ListView(
            children: <Widget>[
//              Logo(),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28.0),
                child: Text(
                  'Sign In',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) => value.isEmpty ? 'please fill' : null,
                  onChanged: (str){
                    setState(() {
                      email = str;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: ' email',
                      hintStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 12)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (str){
                    setState(() {
                      password = str;
                    });
                  },
                  validator: (value) => value.isEmpty ? 'please fill' : null,
                  decoration: InputDecoration(
                      hintText: ' password..',
                      hintStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 12)),
                  obscureText: true,
                ),
              ),
//              valid ? SizedBox() : Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Text('user does not exist', style: TextStyle(color: Colors.red),),
//              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 8, 28, 8),
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: ()async{
                    // var user = await auth.signInWithEmail(email, password);
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => Home(user)));
                  },
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Colors.deepPurple[900],
                          letterSpacing: .5,
                          fontSize: 17.5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(28.0, 8, 28, 8),
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: ()async{
                    // var user = await auth.loginWithGoogle();
                    // if(user != null){
                    //   Navigator.pushReplacement(context,
                    //       MaterialPageRoute(builder: (context) => Home(user)));
                    // }
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Sign In with Google", style: TextStyle(color: Colors.deepPurple[900], fontWeight: FontWeight.normal)),
                        SizedBox(width: 10),
                        FaIcon(FontAwesomeIcons.google)
                       ]
                  )
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't yet have an account?", style: TextStyle(color: Colors.white.withOpacity(0.45))),
                    SizedBox(width: 10),
                    Text("Sign Up", style: TextStyle(color: Colors.white))
                  ]
              )
            ],
          ),
        ));
  }
}

