import 'package:bketoan/bloc/authentication/bloc.dart';
import 'package:bketoan/components/logo_component.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AuthenticationBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount account) async {
      if (account != null) {
        final GoogleSignInAuthentication googleAuth =
            await account.authentication;

        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final FirebaseUser user = await _auth.signInWithCredential(credential);
        _authBloc.authEvent.add(LoggedIn(user: user));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _authBloc = Provider.of<AuthenticationBloc>(context);
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LogoComponent(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3.0,
                ),
                Column(
                  children: <Widget>[
                    ButtonTheme(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      child: RaisedButton(
                        onPressed: () {
                          _handleSignIn();
                        },
                        child: Text('Login with google'),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    _authBloc.authEvent.add(LoggedIn(user: user));
  }
}
