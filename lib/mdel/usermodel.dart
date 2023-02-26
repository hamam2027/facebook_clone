class UserModel {
  String? email;
  String? name;
  String? uId;
  String? password;
  String? phone;
  String? image;
  String? coverimage;
  String? bio;
  bool? isemailverified;
  UserModel(
      {this.email,
      this.password,
      this.name,
      this.phone,
      this.uId,
      this.image,
      this.coverimage,
      this.bio,
      this.isemailverified});
  UserModel.fromjson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    coverimage = json['coverimage'];
    bio = json['bio'];
    isemailverified = json['isemailverified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
      'email': email,
      'uId': uId,
      'phone': phone,
      'image': image,
      'coverimage': coverimage,
      'bio': bio,
      'isemailverified': isemailverified,
    };
  }
}
