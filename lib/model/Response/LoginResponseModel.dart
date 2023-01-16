

class LoginResponseModel {
  String? message;
  bool? error;
  int? code;
  String? response;

  LoginResponseModel({this.message, this.error, this.code, this.response});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    code = json['code'];
    response = json['response'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    data['code'] = code;
    data['response'] = response;
    return data;
  }

}
