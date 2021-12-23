import 'dart:io';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:video_player_mvvm/utils/api_services.dart';
import 'package:video_player_mvvm/utils/contants.dart';
import 'package:video_player_mvvm/youtube_videos/modals/youtube_item_modal.dart';

class YoutubeServices {
  static Future<Object> getLiveVideoId(String channelId) async {
    try {
      // const String url = "youtube.com/channel/UCttspZesZIDEwwpVIgoZtWQ/live";
      // final String channelId = url.split("/")[2];

      // print("channelId: $channelId");

      final response = await http
          .get(Uri.parse("$YOUTUBE_API&channelId=$channelId&key=$API_KEY"));

      // final response = await http.get(
      //   Uri.parse(YOUTUBE_HTML_API + channelId),
      // );

      // var parsedDocument = parse(response.body);
      // print(response.body);

      // var du = parsedDocument.querySelector('videoId');

      // print(du);
      // final response = await http.get(Uri.parse(
      //     "https://3a1dc8dd-f465-423e-aee4-cb001e39e782.mock.pstmn.io/video"));

      // print(response.body);
      if (response.statusCode == 200) {
        return Success(
            code: 200, response: youtubeItemModelFromJson(response.body));
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
