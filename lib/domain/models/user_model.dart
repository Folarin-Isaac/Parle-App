class UserModel {
  final int id;
  final String email;
  final String type;
  final String? phoneNumber;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? profilePhoto;

  UserModel({
    required this.id,
    required this.email,
    required this.type,
    this.phoneNumber,
    this.username,
    this.firstName,
    this.lastName,
    this.profilePhoto,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email_address'],
      type: json['type'],
      phoneNumber: json['phone_number'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      profilePhoto: json['profile_photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email_address': email,
      'type': type,
      'phone_number': phoneNumber,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'profile_photo': profilePhoto,
    };
  }
}
