// To parse this JSON data, do
//
//     final golfGameList = golfGameListFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

GolfGameList golfGameListFromJson(String str) =>
    GolfGameList.fromJson(json.decode(str));

String golfGameListToJson(GolfGameList data) => json.encode(data.toJson());

class GolfGameList {
  GolfGameList({
    required this.data,
  });

  List<GolfGame> data;

  factory GolfGameList.fromJson(Map<String, dynamic> json) => GolfGameList(
        data: List<GolfGame>.from(
            json["success"].map((x) => GolfGame.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class GolfGame {
  GolfGame({
    required this.holeNumber,
    required this.holeId,
    required this.players,
  });

  String holeNumber;
  String holeId;
  List<Player> players;

  factory GolfGame.fromJson(Map<String, dynamic> json) => GolfGame(
        holeNumber: json["holeNumber"],
        holeId: json["hole_id"],
        players:
            List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "holeNumber": holeNumber,
        "hole_id": holeId,
        "players": List<dynamic>.from(players.map((x) => x.toJson())),
      };
}

class Player {
  Player({
    required this.firstName,
    required this.lastName,
    required this.playerId,
    required this.defaultScore,
  });

  String firstName;
  String lastName;
  String playerId;
  RxInt defaultScore;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        firstName: json["firstName"],
        lastName: json["lastName"],
        playerId: json["player_id"],
        defaultScore: int.parse((json["default_score"] ?? 0).toString()).obs,
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "player_id": playerId,
        "default_score": defaultScore,
      };
}
