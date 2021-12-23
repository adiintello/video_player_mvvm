import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:video_player_mvvm/utils/api_services.dart';
import 'package:video_player_mvvm/utils/contants.dart';
import 'package:video_player_mvvm/videos/modals/video_modal.dart';

class VideoServices {
  static Future<Object> getVideos() async {
    try {
      final response = await http.get(Uri.parse(VIDEO_URL));

      if (response.statusCode == 200) {
        return Success(
            code: 200, response: videoListModelFromJson(response.body));
      }
      return Failure(
        code: response.statusCode,
        response: "Invaild response",
      );
    } on FormatException {
      return Failure(
        code: INVALID_FORMAT,
        response: "Conversion error occured",
      );
    } on SocketException {
      return Failure(
        code: NO_INTERNET,
        response: "No internet connection",
      );
    } catch (e) {
      return Failure(
        code: UNKNOWN_ERROR,
        response: "Unknown error occured",
      );
    }
  }
}
