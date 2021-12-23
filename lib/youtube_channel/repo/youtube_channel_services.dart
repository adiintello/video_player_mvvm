import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:video_player_mvvm/utils/api_services.dart';
import 'package:video_player_mvvm/utils/contants.dart';
import 'package:video_player_mvvm/youtube_channel/modal/youtube_channel_modal.dart';

class YoutubeChannelServices {
  static Future<Object> getChannelList() async {
    try {
      final response = await http.get(Uri.parse(CHANNEL_API));

      if (response.statusCode == 200) {
        return Success(
            code: 200, response: youtubeChannelListFromJson(response.body));
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
