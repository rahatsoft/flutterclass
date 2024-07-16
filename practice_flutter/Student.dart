
class Student {
  int? id;
  String? name;
  String? email;
  String? round;

  Student({this.id, this.name, this.email, this.round});

  factory Student.fromJson(Map<String, dynamic> json) => Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      round: json['round']);

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email, "round": round};
  }
}