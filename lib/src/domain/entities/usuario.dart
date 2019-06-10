class UsuarioRequest {
  final String username;
  final String password;

  UsuarioRequest({
    this.username,
    this.password
  });

  factory UsuarioRequest.fromJson(Map<String, dynamic> json) {
    return UsuarioRequest(
      username: json['username'],
      password: json['password']
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
 
    return map;
  }
}