class SigninReqParams {
  final String password;
  final String username;

  SigninReqParams({
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'username': username,
    };
  }
}
