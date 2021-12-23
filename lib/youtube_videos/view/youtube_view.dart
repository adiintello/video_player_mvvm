// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:video_player_mvvm/youtube_videos/view_modal/youtube_item_view_modal.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class YoutubeLiveVideo extends StatefulWidget {
  final String channelId;

  const YoutubeLiveVideo({Key? key, required this.channelId}) : super(key: key);

  @override
  State<YoutubeLiveVideo> createState() => _YoutubeLiveVideoState();
}

class _YoutubeLiveVideoState extends State<YoutubeLiveVideo> {
  late YoutubePlayerController _controller;
  late YoutubeItemViewModal _youtubeLiveVideoModal;
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    _youtubeLiveVideoModal = YoutubeItemViewModal();
    _youtubeLiveVideoModal.getLiveVideoId(widget.channelId);

    _youtubeLiveVideoModal.addListener(viewModalListener);
  }

  @override
  void dispose() {
    _youtubeLiveVideoModal.removeListener(viewModalListener);
    _youtubeLiveVideoModal.dispose();

    super.dispose();
  }

  void viewModalListener() {
    if (_loading != _youtubeLiveVideoModal.loading) {
      _loading = _youtubeLiveVideoModal.loading;
      setState(() {});
    }
  }

  void configYoutubeController(String videoId) async {
    print("Init videoId $videoId");
    _controller = YoutubePlayerController(
      initialVideoId: "sadas",
      params: const YoutubePlayerParams(
        autoPlay: true,
        mute: true,
        enableCaption: false,
      ),
    );

    _controller.handleError((onError, stack) {
      print("Handle Error : $onError");
      print("Stack : $stack");
    });
    _controller.listen((event) {
      print(event.error);
      if (event.error == YoutubeError.videoNotFound ||
          event.error == YoutubeError.cannotFindVideo ||
          event.error == YoutubeError.invalidParam ||
          event.error == YoutubeError.cannotFindVideo ||
          event.error == YoutubeError.html5Error) {
        print("Youtube error occured");

        _youtubeLiveVideoModal.getLiveVideoId(widget.channelId, true);

        print("Reset Video Id :${_youtubeLiveVideoModal.videoId!}");
        _controller.load(_youtubeLiveVideoModal.videoId!);
      }
    });
  }

  Widget _buildWidget(
    BuildContext context,
  ) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      String? videoId = _youtubeLiveVideoModal.videoId;
      if (videoId == null) {
        return const Center(
            child: Text(
          "NO Live Video Found",
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
      } else {
        configYoutubeController(videoId);
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return YoutubePlayerIFrame(
              aspectRatio: constraints.maxWidth / constraints.maxHeight,
              controller: _controller,
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildWidget(context),
      ),
    );
  }
}
