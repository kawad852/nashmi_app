class CountryModel {
  String? code;
  String? nameAR;
  String? nameEN;
  String? dialCode;

  CountryModel({
    this.code,
    this.nameAR,
    this.nameEN,
    this.dialCode,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        code: json["code"],
        nameAR: json["nameAr"],
        nameEN: json["nameEn"],
        dialCode: json["dialCode"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "nameAr": nameAR,
        "nameEn": nameEN,
        "dialCode": dialCode,
      };
}
