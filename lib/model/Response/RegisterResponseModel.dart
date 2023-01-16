class RegisterResponseModel  {
  String? message;
  bool? error;
  int? code;
  Null? response;

  RegisterResponseModel({this.message, this.error, this.code, this.response});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    code = json['code'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    data['code'] = code;
    data['response'] = response;
    return data;
  }

}
