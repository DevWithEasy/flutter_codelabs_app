import 'package:code_labs/components/video_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for SystemChrome
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends StatefulWidget {
  final String title;
  const VideosScreen({super.key, required this.title});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late YoutubePlayerController _controller;
  int lesson = 1;
  late String videoId;
  late String videoUri;

  final List videos = [
    {
      "id": 1,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=xpP5L1NuMQU"
    },
    {
      "id": 2,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=fBhxs9OHxtY"
    },
    {
      "id": 3,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=HvpmqQ53Rjw"
    },
    {
      "id": 4,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=7AA6H_NBiL0"
    },
    {
      "id": 5,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=9fLfvLAIajA"
    },
    {
      "id": 6,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=uBEKIMJx50E"
    },
    {
      "id": 7,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=S09l_YSOp80"
    },
    {
      "id": 8,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=w-HOpmckKF8"
    },
    {
      "id": 9,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=wedlzr3HeGx0"
    },
    {
      "id": 10,
      "course_id": 1,
      "url": "https://www.youtube.com/watch?v=CFFT5GJlII4"
    },
  ];

  @override
  void initState() {
    super.initState();
    videoUri = videos[0]['url'];
    videoId = YoutubePlayer.convertUrlToId(videoUri) ?? 'default_video_id';
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge); // Reset system UI when exiting
    _controller.dispose();
    super.dispose();
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(videoUri);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 16 / 9, // Set aspect ratio for fullscreen videos
                child: YoutubePlayer(controller: _controller),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(widget.title,maxLines: 2),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    // onPressed: (){
                    //   _launchUrl();
                    // },
                    onPressed: () async {
                      final Uri url = Uri.parse(videoUri);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,  // This forces the URL to open in an external app
                        );
                      } else {
                        throw 'Could not launch $videoUri';
                      }
                    },
                    icon: const Icon(Icons.play_circle,color: Colors.red),
                    label: const Text('Youtube Fullscreen',style: TextStyle(color: Colors.red)),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton.icon(
                    onPressed: (){},
                    icon: const Icon(Icons.check,color: Colors.blue),
                    label: const Text('Complete',style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Courses all videos'),
                  Text('Playing : Lesson-${lesson.toString()}'),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: videos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1 / 0.55,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            lesson = index + 1;
                            videoUri = videos[index]['url'];
                            videoId = YoutubePlayer.convertUrlToId(videoUri)!;
                            _controller.load(videoId);
                          });
                        },
                        child: VideoListItem(videoUrl: videos[index]['url'], lesson: index)
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
