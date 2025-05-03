class SignUpModel {
  final String email;
  final String fullname;

  final String password;


  SignUpModel({
    required this.email,
    required this.password,
    required this.fullname,


  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'full_name': fullname,

    };
  }
}
