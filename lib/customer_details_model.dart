import 'dart:convert';

class CostumerDetailsModel {
  String code;
  int id;
  int lineCount;
  int merchantId;
  int position;
  int queueId;
  int waitTime;

  CostumerDetailsModel({
    this.code,
    this.id,
    this.lineCount,
    this.merchantId,
    this.position,
    this.queueId,
    this.waitTime,
  });

  factory CostumerDetailsModel.fromJson(Map<String, dynamic> json) {
    return new CostumerDetailsModel(
      code: json["code"],
      id: json["id"],
      lineCount: json["line-count"],
      merchantId: json["merchantID"],
      position: json["position"],
      queueId: json["queueID"],
      waitTime: json["wait-time"],
    );
  }
}
