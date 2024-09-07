import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoListItem extends StatefulWidget {
  final String videoId;
  final int lesson;
  const VideoListItem({super.key, required this.videoId, required this.lesson});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late YoutubePlayerController _controller;
  late String videoId;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
          forceHD: false,
          isLive: false,
          disableDragSeek: false,
          loop: false,
          hideControls: true
        )
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: YoutubePlayer(
              controller: _controller
          )
        ),
        Positioned(
          bottom : 5,
          right : 5,
          child: Padding(
            padding: const EdgeInsets.only(left: 4,top: 4),
            child: Container(
              width : 30,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  borderRadius: BorderRadius.circular(8)
              ),
              padding: const EdgeInsets.all(2),
              child: Text(
                  (widget.lesson+1).toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 12
                  )
              ),
            ),
          ),
        )
      ]
    );
  }
}
