class UserModel {
  final String id;
  final String username;
  final String email;
  final String plateNumber;
  final int points;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.plateNumber,
    this.points = 0,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      plateNumber: json['plateNumber'],
      points: json['points'],
    );
  }
}

UserModel globalUserModel = UserModel(
  id: '20.11.9999',
  username: 'Username',
  email: 'username@students.amikom.ac.id',
  plateNumber: 'AB 6734 HH',
  points: 1000,
);
