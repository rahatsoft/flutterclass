class UserSignup {
  int? id;
  String? name;
  String? email;
  String? password;
  String? role;
  String? image;

  UserSignup({this.id, this.name, this.email, this.password, this.role, this.image});

  factory UserSignup.fromJson(Map<String, dynamic> json) => UserSignup(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      image: json['image']);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "role": role,
      "image": image
    };
  }
}
