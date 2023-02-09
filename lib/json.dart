class Jsonfile {
  String? email;

  String? password;

  Jsonfile({this.email, this.password});

  Jsonfile.fromJson(Map<String,dynamic> json) {
    email = json['email'];
    password = json['password'];
  }
}
