class TokenModel {
  final String token;

  TokenModel({required this.token});

  factory TokenModel.fromJson(Map data) {
    return TokenModel(token: data["access_token"]);
  }
}
