// To parse this JSON data, do
//
//     final youtubeChannelList = youtubeChannelListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

YoutubeChannelList youtubeChannelListFromJson(String str) =>
    YoutubeChannelList.fromJson(json.decode(str));

String youtubeChannelListToJson(YoutubeChannelList data) =>
    json.encode(data.toJson());

class YoutubeChannelList {
  YoutubeChannelList({
    this.data,
  });

  final List<Datum>? data;

  factory YoutubeChannelList.fromJson(Map<String, dynamic> json) =>
      YoutubeChannelList(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.attributes,
  });

  final int? id;
  final DatumAttributes? attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        attributes: json["attributes"] == null
            ? null
            : DatumAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "attributes": attributes == null ? null : attributes!.toJson(),
      };
}

class DatumAttributes {
  DatumAttributes({
    this.name,
    this.channelId,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.thumbnail,
  });

  final String? name;
  final String? channelId;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;
  final Thumbnail? thumbnail;

  factory DatumAttributes.fromJson(Map<String, dynamic> json) =>
      DatumAttributes(
        name: json["name"] == null ? null : json["name"],
        channelId: json["channel_id"] == null ? null : json["channel_id"],
        description: json["description"] == null ? null : json["description"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "channel_id": channelId == null ? null : channelId,
        "description": description == null ? null : description,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "publishedAt":
            publishedAt == null ? null : publishedAt!.toIso8601String(),
        "thumbnail": thumbnail == null ? null : thumbnail!.toJson(),
      };
}

class Thumbnail {
  Thumbnail({
    this.data,
  });

  final Data? data;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.attributes,
  });

  final int? id;
  final DataAttributes? attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? null : json["id"],
        attributes: json["attributes"] == null
            ? null
            : DataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "attributes": attributes == null ? null : attributes!.toJson(),
      };
}

class DataAttributes {
  DataAttributes({
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  final String? name;
  final String? alternativeText;
  final String? caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic? previewUrl;
  final String? provider;
  final dynamic? providerMetadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory DataAttributes.fromJson(Map<String, dynamic> json) => DataAttributes(
        name: json["name"] == null ? null : json["name"],
        alternativeText:
            json["alternativeText"] == null ? null : json["alternativeText"],
        caption: json["caption"] == null ? null : json["caption"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        formats:
            json["formats"] == null ? null : Formats.fromJson(json["formats"]),
        hash: json["hash"] == null ? null : json["hash"],
        ext: json["ext"] == null ? null : json["ext"],
        mime: json["mime"] == null ? null : json["mime"],
        size: json["size"] == null ? null : json["size"].toDouble(),
        url: json["url"] == null ? null : json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"] == null ? null : json["provider"],
        providerMetadata: json["provider_metadata"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "alternativeText": alternativeText == null ? null : alternativeText,
        "caption": caption == null ? null : caption,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "formats": formats == null ? null : formats!.toJson(),
        "hash": hash == null ? null : hash,
        "ext": ext == null ? null : ext,
        "mime": mime == null ? null : mime,
        "size": size == null ? null : size,
        "url": url == null ? null : url,
        "previewUrl": previewUrl,
        "provider": provider == null ? null : provider,
        "provider_metadata": providerMetadata,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}

class Formats {
  Formats({
    this.thumbnail,
    this.medium,
    this.small,
  });

  final Medium? thumbnail;
  final Medium? medium;
  final Medium? small;

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: json["thumbnail"] == null
            ? null
            : Medium.fromJson(json["thumbnail"]),
        medium: json["medium"] == null ? null : Medium.fromJson(json["medium"]),
        small: json["small"] == null ? null : Medium.fromJson(json["small"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail == null ? null : thumbnail!.toJson(),
        "medium": medium == null ? null : medium!.toJson(),
        "small": small == null ? null : small!.toJson(),
      };
}

class Medium {
  Medium({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.width,
    this.height,
    this.size,
    this.path,
    this.url,
  });

  final String? name;
  final String? hash;
  final String? ext;
  final String? mime;
  final int? width;
  final int? height;
  final double? size;
  final dynamic? path;
  final String? url;

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
        name: json["name"] == null ? null : json["name"],
        hash: json["hash"] == null ? null : json["hash"],
        ext: json["ext"] == null ? null : json["ext"],
        mime: json["mime"] == null ? null : json["mime"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        size: json["size"] == null ? null : json["size"].toDouble(),
        path: json["path"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "hash": hash == null ? null : hash,
        "ext": ext == null ? null : ext,
        "mime": mime == null ? null : mime,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "size": size == null ? null : size,
        "path": path,
        "url": url == null ? null : url,
      };
}
