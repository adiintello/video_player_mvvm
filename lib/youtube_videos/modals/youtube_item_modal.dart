// To parse this JSON data, do
//
//     final youtubeItemModel = youtubeItemModelFromJson(jsonString);

import 'dart:convert';

YoutubeItemModel youtubeItemModelFromJson(String str) =>
    YoutubeItemModel.fromJson(json.decode(str));

String youtubeItemModelToJson(YoutubeItemModel data) =>
    json.encode(data.toJson());

class YoutubeItemModel {
  final List<Item> items;

  YoutubeItemModel({
    required this.items,
  });

  factory YoutubeItemModel.fromJson(Map<String, dynamic> json) =>
      YoutubeItemModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.kind,
    required this.etag,
    required this.id,
  });

  final String kind;
  final String etag;
  final Id id;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: Id.fromJson(json["id"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id.toJson(),
      };
}

class Id {
  Id({
    required this.kind,
    required this.videoId,
  });

  final String kind;
  final String videoId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        kind: json["kind"],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "videoId": videoId,
      };
}
