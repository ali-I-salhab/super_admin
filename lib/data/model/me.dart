class MeModel {
  String? email;
  String? username;
  String? phone;
  String? country;
  bool? isStaff;
  String? firstName;
  String? lastName;
  bool? isActive;
  int? id;

  MeModel(
      {this.email,
      this.username,
      this.phone,
      this.country,
      this.isStaff,
      this.firstName,
      this.lastName,
      this.isActive,
      this.id});

  MeModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    country = json['country'];
    isStaff = json['is_staff'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isActive = json['is_active'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['country'] = this.country;
    data['is_staff'] = this.isStaff;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['is_active'] = this.isActive;
    data['id'] = this.id;
    return data;
  }
}
