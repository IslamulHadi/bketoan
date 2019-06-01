import 'package:bketoan/bloc/authentication/bloc.dart';
import 'package:bketoan/route_generator.dart';
import 'package:bketoan/screens/home_screen.dart';
import 'package:bketoan/screens/register_screen.dart';
import 'package:bketoan/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc _authBloc = AuthenticationBloc();

  @override
  void initState() {
    super.initState();
    _authBloc.authEvent.add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationBloc>(
          builder: (_) => _authBloc,
          dispose: (_, value) => value.dispose(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Color(0xFFFFFFFF)),
        debugShowCheckedModeBanner: false,
        title: 'Bketoan',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: StreamBuilder<AuthenticationState>(
            stream: _authBloc.authState,
            initialData: AuthenticationUninitialized(),
            builder: (
              BuildContext context,
              AsyncSnapshot<AuthenticationState> snapshot,
            ) {
              if (snapshot.data is AuthenticationUninitialized) {
                return Splash();
              } else if (snapshot.data is AuthenticationAuthenticated) {
                return Home();
              } else if (snapshot.data is AuthenticationUnauthenticated) {
                return Register();
              } else {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}
