import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static Future<Map<String, dynamic>> login({
    @required String email,
    @required String password,
  }) async {
    // Map<String, dynamic> response =
    //     await AuthApi.login({'email': email, 'password': password});
    // return response;
  }

  static Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  static Future<void> persistToken(String token) async {
    // ApiClient.authToken = token;
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('token', token);
  }

  static Future<void> persistUser(String user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user', user);
  }

  static Future<String> loadUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }

  static Future<bool> hasToken() async {
    String token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    if (token != null) {
      // Map<String, dynamic> responseData = await AuthApi.validateToken(token);
      // print(responseData);
      // if (responseData['message'] == "Token Valid") {
      //   // ApiClient.authToken = token;
      //   print(token);
      //   return true;
      // } else {
      //   handleLoginMethod();
      //   return false;
      // }
    }
    // handleLoginMethod();
    return false;
  }

  // static handleLoginMethod() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String loginMethod = prefs.getString('loginMethod');
  //   if (loginMethod == 'google') {
  //     GoogleSignIn _googleSignIn = GoogleSignIn(
  //       scopes: [
  //         'email',
  //         'https://www.googleapis.com/auth/contacts.readonly',
  //       ],
  //     );
  //     _googleSignIn.disconnect();
  //   }
  //   prefs.remove('loginMethod');
  // }
}
