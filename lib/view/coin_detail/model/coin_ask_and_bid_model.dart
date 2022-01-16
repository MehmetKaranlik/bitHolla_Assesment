import 'dart:convert';

class CoinAskAndBidModel {
  CoinAskAndBidModel({
    this.topic,
    this.action,
    this.symbol,
    this.data,
    this.time,
  });

  String? topic;
  String? action;
  String? symbol;
  Data? data;
  int? time;

  factory CoinAskAndBidModel.fromRawJson(String str) => CoinAskAndBidModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoinAskAndBidModel.fromJson(Map<String, dynamic> json) => CoinAskAndBidModel(
        topic: json["topic"],
        action: json["action"],
        symbol: json["symbol"],
        data: Data.fromJson(json["data"]),
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "topic": topic,
        "action": action,
        "symbol": symbol,
        "data": data!.toJson(),
        "time": time,
      };
}

class Data {
  Data({
    this.bids,
    this.asks,
    this.timestamp,
  });

  List<List<double>>? bids;
  List<List<double>>? asks;
  DateTime? timestamp;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        bids: List<List<double>>.from(json["bids"].map((x) => List<double>.from(x.map((x) => x.toDouble())))),
        asks: List<List<double>>.from(json["asks"].map((x) => List<double>.from(x.map((x) => x.toDouble())))),
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "bids": List<dynamic>.from(bids!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "asks": List<dynamic>.from(asks!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "timestamp": timestamp!.toIso8601String(),
      };
}
