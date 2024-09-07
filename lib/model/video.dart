class Video{
  final String orderNo;
  final String course;
  final String videoId;
  final bool isComplete;
  Video({
    required this.orderNo,
    required this.course,
    required this.videoId,
    required this.isComplete
});
  factory Video.fromMap(Map<String,dynamic> video){
    return Video(
      orderNo: video['orderNo'].toString(),
      course: video['course'],
      videoId: video['videoId'],
      isComplete: video['isComplete']
    );
  }
}