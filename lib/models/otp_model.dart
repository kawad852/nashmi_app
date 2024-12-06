class OtpModel {
  int? status;
  String? message;

  OtpModel({
    this.status,
    this.message,
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
