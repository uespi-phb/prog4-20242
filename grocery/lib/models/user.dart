class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String cpf;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.cpf,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        cpf: json['cpf'],
      );
}
