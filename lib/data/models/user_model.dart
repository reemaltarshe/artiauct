class UserModel {
  final int? id;
  final String username;
  final String? firstName;
  final String? lastName;
  final String email;
  final String? phoneNumber;
  final String? profileImage;
  final String? bio;
  final DateTime? dateJoined;
  final bool isActive;
  final bool isVerified;
  final List<String>? roles;

  UserModel({
    this.id,
    required this.username,
    this.firstName,
    this.lastName,
    required this.email,
    this.phoneNumber,
    this.profileImage,
    this.bio,
    this.dateJoined,
    this.isActive = true,
    this.isVerified = false,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'] ?? '',
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'] ?? '',
      phoneNumber: json['phone_number'],
      profileImage: json['profile_image'],
      bio: json['bio'],
      dateJoined: json['date_joined'] != null 
          ? DateTime.parse(json['date_joined']) 
          : null,
      isActive: json['is_active'] ?? true,
      isVerified: json['is_verified'] ?? false,
      roles: json['roles'] != null 
          ? List<String>.from(json['roles']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'username': username,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (profileImage != null) 'profile_image': profileImage,
      if (bio != null) 'bio': bio,
      if (dateJoined != null) 'date_joined': dateJoined!.toIso8601String(),
      'is_active': isActive,
      'is_verified': isVerified,
      if (roles != null) 'roles': roles,
    };
  }

  UserModel copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? profileImage,
    String? bio,
    DateTime? dateJoined,
    bool? isActive,
    bool? isVerified,
    List<String>? roles,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      bio: bio ?? this.bio,
      dateJoined: dateJoined ?? this.dateJoined,
      isActive: isActive ?? this.isActive,
      isVerified: isVerified ?? this.isVerified,
      roles: roles ?? this.roles,
    );
  }

  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName';
    } else if (firstName != null) {
      return firstName!;
    } else if (lastName != null) {
      return lastName!;
    }
    return username;
  }

  bool get hasProfileImage => profileImage != null && profileImage!.isNotEmpty;

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, fullName: $fullName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
} 