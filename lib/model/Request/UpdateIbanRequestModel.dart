class UpdateIbanRequestModel {
  String? name;
  String? bankName;
  String? iban;

  UpdateIbanRequestModel({this.name, this.bankName, this.iban});

  UpdateIbanRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    bankName = json['bank_name'];
    iban = json['iban'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['bank_name'] = bankName;
    data['iban'] = iban;
    return data;
  }
}
