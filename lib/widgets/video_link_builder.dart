import 'package:fishdroid/data/hatch_video_data.dart';
import 'package:flutter/material.dart';

class VideoLink extends StatefulWidget {
  final HatchVideoData hatchItem;
  const VideoLink(this.hatchItem, {super.key});

  @override
  State<VideoLink> createState() => _VideoLinkState();
}

class _VideoLinkState extends State<VideoLink> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.hatchItem.videoLink);
  }
}