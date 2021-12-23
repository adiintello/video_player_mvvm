import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_mvvm/videos/view_modals/video_view_modal.dart';

class VideoView extends StatelessWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _videoListViewModal = Provider.of<VideoViewModel>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              _buildWidget(_videoListViewModal),
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildWidget(VideoViewModel videoListViewModal) {
    if (videoListViewModal.loading) {
      return Container(
        color: Colors.yellow,
        child: const Text("LOADING...."),
      );
    }
    return Container();
  }
}

// https://www.youtube.com/watch?v=Xmm3Kr5P1Uw&ab_channel=IndiaTV