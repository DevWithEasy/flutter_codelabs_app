import 'package:code_labs/components/video_list_item.dart';
import 'package:code_labs/components/video_skelton.dart';
import 'package:code_labs/model/video.dart';
import 'package:code_labs/service/course_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideosScreen extends StatefulWidget {
  final String id;
  final String title;
  const VideosScreen({super.key, required this.title, required this.id});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late YoutubePlayerController _controller;
  int lesson = 1;
  late String videoId;

  late List<Video> videos = [];
  bool loading = false;
  int videoCount = 0;

  @override
  void initState(){
    fetchVides();
    super.initState();
  }

  void fetchVides()async{
    loading = true;
    final data = await CourseApi.videos(widget.id);
    setState(() {
      videoId = data[0].videoId;
      videos = data;
      loading = false;
      videoCount = data.length;
    });
    _controller = YoutubePlayerController(
      initialVideoId: data[0].videoId,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: loading ?
      const VideoSkelton():
      !loading && videoCount==0 ?
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
                'assets/animation/uploading.json',
                width: 200,
                height: 200
            ),
            const Text('No course added')
          ],
        ),
      ):
      Padding(
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
                    onPressed: () async {
                      final Uri url = Uri.parse('https://www.youtube.com/watch?v=$videoId');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,  // This forces the URL to open in an external app
                        );
                      } else {
                        throw 'Could not launch';
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
                            _controller.load(videos[index].videoId);
                          });
                        },
                        child: VideoListItem(videoId: videos[index].videoId, lesson: index)
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
