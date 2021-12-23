// ignore_for_file: prefer_if_null_operators, constant_identifier_names

import 'dart:convert';

List<VideoModel> videoListModelFromJson(String str) =>
    List<VideoModel>.from(json.decode(str).map((x) => VideoModel.fromJson(x)));

String videoListModelToJson(List<VideoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoModel {
  VideoModel({
    this.description,
    this.sources,
    this.subtitle,
    this.thumb,
    this.title,
  });

  String? description;
  List<String>? sources;
  Subtitle? subtitle;
  String? thumb;
  String? title;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        description: json["description"] == null ? null : json["description"],
        sources: json["sources"] == null
            ? null
            : List<String>.from(json["sources"].map((x) => x)),
        subtitle: json["subtitle"] == null
            ? null
            : subtitleValues.map![json["subtitle"]],
        thumb: json["thumb"] == null ? null : json["thumb"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "sources":
            sources == null ? null : List<dynamic>.from(sources!.map((x) => x)),
        "subtitle": subtitle == null ? null : subtitleValues.reverse[subtitle],
        "thumb": thumb == null ? null : thumb,
        "title": title == null ? null : title,
      };
}

enum Subtitle { BY_BLENDER_FOUNDATION, BY_GOOGLE, BY_GARAGE419 }

final subtitleValues = EnumValues({
  "By Blender Foundation": Subtitle.BY_BLENDER_FOUNDATION,
  "By Garage419": Subtitle.BY_GARAGE419,
  "By Google": Subtitle.BY_GOOGLE
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
