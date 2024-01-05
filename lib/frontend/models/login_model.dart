class LoginRequestModel {
  final String grantType;
  final String username;
  final String password;

  LoginRequestModel({
    required this.grantType,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "grant_type": grantType,
      "username": username,
      "password": password,
    };
  }
}

class LoginResponseModel {
  final String? accessToken;

  LoginResponseModel({this.accessToken});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['access_token'],
    );
  }
}
