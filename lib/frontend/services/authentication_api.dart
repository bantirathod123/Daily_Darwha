// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../models/login_model.dart';
//
// class APIService {
//   Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
//     const String url = "https://s360app.mycw.in/cw-identity/oauth/token";
//
//     final response = await http.post(
//       Uri.parse(url),
//       body: {
//         'grant_type': requestModel.grantType,
//         'username': requestModel.username,
//         'password': requestModel.password,
//       },
//       headers: {
//         'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
//         'Authorization': 'Basic dGFsazJhbWFyZXN3YXJhbjpteS1zZWNyZXQ='
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final responseBody = json.decode(response.body);
//       final accessToken = responseBody['access_token'] as String;
//
//       return LoginResponseModel(accessToken: accessToken);
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
