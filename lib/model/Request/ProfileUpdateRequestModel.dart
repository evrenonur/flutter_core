class ProfileUpdateRequestModel {
  String? name;
  String? email;
  String? password;

  ProfileUpdateRequestModel({this.name, this.email, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    if (password != null) {
      data['password'] = password;
    }
    return data;
  }
}