import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_mvvm/youtube_channel/view_modal/youtube_channel_view_modal.dart';
import 'package:video_player_mvvm/youtube_videos/view/youtube_view.dart';

class YoutubeChannelView extends StatelessWidget {
  const YoutubeChannelView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _youtuubrChannelViewModel =
        Provider.of<YoutubeChannelViewModal>(context);

    Widget _buildWidget(YoutubeChannelViewModal youtubeChannelViewModal) {
      if (youtubeChannelViewModal.loading) {
        return Container(
          child: CircularProgressIndicator(
            value: 200,
          ),
        );
      } else {
        return GridView.builder(
            primary: false,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: youtubeChannelViewModal.channelList?.data?.length,
            itemBuilder: (ctx, index) {
              String? imageUrl = youtubeChannelViewModal.channelList
                  ?.data?[index].attributes?.thumbnail?.data?.attributes?.url;

              String? name = youtubeChannelViewModal
                  .channelList?.data?[index].attributes?.name;

              String? channelId = youtubeChannelViewModal
                  .channelList?.data?[index].attributes?.channelId;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YoutubeLiveVideo(
                              channelId: channelId!,
                            )),
                  );
                },
                child: Container(
                    child: Center(
                        child: Text(
                      name ?? "",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              imageUrl != null
                                  ? "http://localhost:1337${imageUrl}"
                                  : "https://images.unsplash.com/photo-1640020580603-e7beafd75d94?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.4))),
              );
            });
      }
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              _buildWidget(_youtuubrChannelViewModel),
            ]),
          )
        ],
      ),
    );
  }
}
