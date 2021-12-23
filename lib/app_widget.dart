import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_mvvm/youtube_channel/view/youtube_channel_view.dart';
import 'package:video_player_mvvm/youtube_channel/view_modal/youtube_channel_view_modal.dart';
import 'package:video_player_mvvm/youtube_videos/view/youtube_view.dart';
import 'package:video_player_mvvm/videos/view_modals/video_view_modal.dart';
import 'package:video_player_mvvm/youtube_videos/view_modal/youtube_item_view_modal.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoViewModel()),
        ChangeNotifierProvider(create: (context) => YoutubeChannelViewModal()),
        // ChangeNotifierProvider(create: (context) => YoutubeItemViewModal())
      ],
      child: MaterialApp(
          title: 'Video Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: YoutubeChannelView()
          //  const YoutubeLiveVideo(
          //   channelId: "UCttspZesZIDEwwpVIgoZtWQ",
          // ),
          ),
    );
  }
}
