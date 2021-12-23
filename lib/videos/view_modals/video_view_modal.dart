// ignore: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:video_player_mvvm/utils/api_services.dart';
import 'package:video_player_mvvm/videos/modals/video_modal.dart';
import 'package:video_player_mvvm/videos/repo/video_api_services.dart';

class VideoViewModel extends ChangeNotifier {
  bool _loading = false;
  List<VideoModel> _videoListModel = [];
  VideoModel _selectedVideo = VideoModel();

  bool get loading => _loading;
  List<VideoModel> get videoListModel => _videoListModel;
  VideoModel get selectedVideoModel => _selectedVideo;

  VideoViewModel() {
    getVideoList();
  }

  void setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  void setVideoListModel(List<VideoModel> videoListModel) {
    _videoListModel = videoListModel;
  }

  void setSelectedVideoModel(VideoModel videoModel) {
    _selectedVideo = videoModel;
  }

  void getVideoList() async {
    setLoading(true);

    var response = await VideoServices.getVideos();
    if (response is Success) {
      setVideoListModel(response.response as List<VideoModel>);
    }
    if (response is Failure) {
      // Handle user error
      debugPrint(response.response.toString());
    }

    setLoading(false);
  }
}
