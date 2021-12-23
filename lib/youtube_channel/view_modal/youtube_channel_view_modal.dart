// ignore: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:video_player_mvvm/local/local_db.dart';
import 'package:video_player_mvvm/utils/api_services.dart';
import 'package:video_player_mvvm/youtube_channel/modal/youtube_channel_modal.dart';
import 'package:video_player_mvvm/youtube_channel/repo/youtube_channel_services.dart';
import 'package:video_player_mvvm/youtube_videos/modals/youtube_item_modal.dart';
import 'package:video_player_mvvm/youtube_videos/repo/youtube_api_services.dart';

class YoutubeChannelViewModal extends ChangeNotifier {
  bool _loading = true;
  YoutubeChannelList? _channelList;
  late LocalDB localDB;

  bool get loading => _loading;
  YoutubeChannelList? get channelList => _channelList;

  YoutubeChannelViewModal() {
    getChannelList();
    localDB = LocalDB();
  }

  void setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  void getChannelList() async {
    setLoading(true);

    var response = await YoutubeChannelServices.getChannelList();
    if (response is Success) {
      _channelList = (response.response as YoutubeChannelList);
    }
    if (response is Failure) {
      // Handle user error
      debugPrint(response.response.toString());
    }

    setLoading(false);
  }
}
