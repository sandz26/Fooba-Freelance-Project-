class AppUser {
  final int id;
  final String uid;
  final String idNumber;
  final String email;
  final String firstname;
  final String lastname;
  final String phoneNumber;
  final String? address;
  final String nationality;
  final String? dateOfBirth;
  final String? gender;
  final String? sourceOfFunds;
  final bool isStaff;
  final bool isActive;
  final bool isVerified;
  final bool isFicaCompliant;
  final DateTime createdAt;
  final DateTime updatedAt;
  //final List<String> roles;
  //final List<String> permissions;

  AppUser({
    required this.id,
    required this.uid,
    required this.idNumber,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.phoneNumber,
    this.address,
    this.nationality = "South African",
    this.dateOfBirth,
    this.gender,
    this.sourceOfFunds,
    this.isStaff = false,
    this.isActive = true,
    this.isVerified = false,
    this.isFicaCompliant = false,
    required this.createdAt,
    required this.updatedAt,
    //required this.roles,
    //required this.permissions,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      uid: json['uid'],
      idNumber: json['id_number'],
      email: json['email'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phoneNumber: json['phone_number'],
      address: json['address'],
      nationality: json['nationality'] ?? "South African",
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      sourceOfFunds: json['source_of_funds'],
      isStaff: json['is_staff'] ?? false,
      isActive: json['is_active'] ?? true,
      isVerified: json['is_verified'] ?? false,
      isFicaCompliant: json['is_fica_compliant'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      //roles: List<String>.from(json['roles'] ?? []),
      //permissions: List<String>.from(json['permissions'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'id_number': idNumber,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'phone_number': phoneNumber,
      'address': address,
      'nationality': nationality,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'source_of_funds': sourceOfFunds,
      'is_staff': isStaff,
      'is_active': isActive,
      'is_verified': isVerified,
      'is_fica_compliant': isFicaCompliant,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      //'roles': roles,
      //'permissions': permissions,
    };
  }
}