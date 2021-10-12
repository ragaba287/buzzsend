class SignUserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;

  SignUserModel({
    this.name,
    this.email,
    this.phone,
    this.uId,
  });

  SignUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
  }

  Map<String, dynamic> topMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
    };
  }
}
