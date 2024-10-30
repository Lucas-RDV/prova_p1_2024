class Token {
  int? id;
  String token;
  Token({required this.token});
  Map<String, dynamic> toMap() {
    var map = {
      'token': token
    };
    return map;
  }
}