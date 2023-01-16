class UpdateIbanResponseModel {
  String? message;
  bool? error;
  int? code;
  Response? response;

  UpdateIbanResponseModel({this.message, this.error, this.code, this.response});

  UpdateIbanResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    error = json['error'];
    code = json['code'];
    response = json['response'] != null
        ? Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['error'] = error;
    data['code'] = code;
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  int? id;
  int? userId;
  String? name;
  String? bankName;
  String? iban;
  String? createdAt;
  String? updatedAt;

  Response(
      {this.id,
        this.userId,
        this.name,
        this.bankName,
        this.iban,
        this.createdAt,
        this.updatedAt});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    bankName = json['bank_name'];
    iban = json['iban'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['bank_name'] = bankName;
    data['iban'] = iban;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
