// ignore: prefer_final_fields

// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:video_player_mvvm/local/local_db.dart';
import 'package:video_player_mvvm/utils/api_services.dart';
import 'package:video_player_mvvm/youtube_videos/modals/youtube_item_modal.dart';
import 'package:video_player_mvvm/youtube_videos/repo/youtube_api_services.dart';

class YoutubeItemViewModal extends ChangeNotifier {
  late LocalDB localDB;
  bool _loading = false;
  String? _videoId;

  bool get loading => _loading;
  String? get videoId => _videoId;

  YoutubeItemViewModal() {
    localDB = LocalDB();
  }

  void setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  Future<void> setLiveVideoIdOnline(String channelId) async {
    print("API called");
    var response = await YoutubeServices.getLiveVideoId(channelId);
    if (response is Success) {
      _videoId = (response.response as YoutubeItemModel).items.first.id.videoId;
      print(_videoId);
      localDB.setVideoID(channelId, _videoId!);
    }
    if (response is Failure) {
      // Handle user error
      debugPrint(
        response.response.toString(),
      );
    }
  }

  Future<void> getLiveVideoId(String channelId,
      [bool isVideoIdInvalid = false]) async {
    setLoading(true);

    if (isVideoIdInvalid) {
      await setLiveVideoIdOnline(channelId);
    } else {
      final savedVideoId = await localDB.getVideoID(channelId);

      if (savedVideoId != null) {
        // _videoId = savedVideoId;
        print("Cache called");

        _videoId = "savedVideoId  dummy";
      } else {
        await setLiveVideoIdOnline(channelId);
      }
    }

    setLoading(false);
  }
}
