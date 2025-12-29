class SignupReqParams {
  final String name;
  final String lastName;
  //final String role;
  final String password;
  final String username;

  SignupReqParams({
    required this.name,
    required this.lastName,
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastName': lastName,
      'password': password,
      'username': username,
    };
  }
}
