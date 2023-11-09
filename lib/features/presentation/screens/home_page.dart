import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:video_sharing/features/presentation/screens/comments/show_comment.dart';
import '../../../core/data/my_colors.dart';
import '../../../core/utils/circle_image.dart';
import '../../domain/entities/bottom_nav.dart';
import '../../domain/entities/video_model.dart';
import '../widgets/appbar.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/video_player.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage();
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  final List<VideoModel> videos = [
    VideoModel(
        videoAsset: 'assets/videos/video_2.mp4',
        description: 'Video 1 Description'),
    VideoModel(
        videoAsset: 'assets/videos/video_1.mp4',
        description: 'Video 2 Description'),
    VideoModel(
        videoAsset: 'assets/videos/video_2.mp4',
        description: 'Video 2 Description'),
  ];
  late PersistentBottomSheetController sheetController;

  ChewieController? _chewieController;
  late VideoPlayerController _videoPlayerController;
  int _currentIndex = 0;
  bool _isHidden = false;
  bool showComment = false;
  late BuildContext _scaffoldCtx;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset(videos[_currentIndex].videoAsset)
          ..initialize().then((_) {
            setState(() {
              _chewieController = ChewieController(
                videoPlayerController: _videoPlayerController,
                autoPlay: true,
                looping: true,
                draggableProgressBar: false,
                showControls: false,
                zoomAndPan: true,
              );
            });
          });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  List<PopupMenuEntry<String>> menuItems = [
    const PopupMenuItem<String>(
      value: 'item1',
      child: ListTile(
        leading: Icon(Icons.add),
        title: Text('Post a Seequl'),
      ),
    ),
    const PopupMenuItem<String>(
      value: 'item2',
      child: ListTile(
        leading: Icon(
          Icons.favorite_sharp,
        ),
        title: Text('View your likes'),
      ),
    ),
    const PopupMenuItem<String>(
      value: 'item2',
      child: ListTile(
        leading: Icon(
          Icons.favorite_sharp,
        ),
        title: Text('Your Seequl posts'),
      ),
    ),
    const PopupMenuItem<String>(
      value: 'item2',
      child: ListTile(
        leading: Icon(
          Icons.book,
        ),
        title: Text('Reference contribution'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: MyAppBar(),
        body: Builder(builder: (BuildContext ctx) {
          _scaffoldCtx = ctx;
          return GestureDetector(
            onTap: () {
              setState(() {
                showComment = !showComment;
                if (showComment) {
                  _showComments(_scaffoldCtx);
                } else {
                  Navigator.pop(_scaffoldCtx);
                }
              });
            },
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                // User swiped downwards
                setState(() {
                  _currentIndex = (_currentIndex + 1) % videos.length;
                  _videoPlayerController = VideoPlayerController.asset(
                      videos[_currentIndex].videoAsset)
                    ..initialize().then((_) {
                      setState(() {
                        _chewieController = ChewieController(
                          videoPlayerController: _videoPlayerController,
                          autoPlay: true,
                          looping: true,
                          draggableProgressBar: false,
                          showControls: false,
                        );
                      });
                    })
                    ..addListener(() {
                      if (_videoPlayerController.value.hasError) {
                        print(
                            "Error: ${_videoPlayerController.value.errorDescription}");
                      }
                    });
                });
              }
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    // full screen video
                    Container(
                      child: _chewieController != null &&
                              _chewieController!
                                  .videoPlayerController.value.isInitialized
                          ? AspectRatio(
                              aspectRatio: _chewieController!
                                  .videoPlayerController.value.aspectRatio,
                              child: Chewie(
                                controller: _chewieController!,
                              ),
                            )
                          : const CircularProgressIndicator(),
                    ),

                    // floating card at bottom center
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 30,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(76, 66, 67, 0.66),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: ExpandableText(
                            "Lorem ipsum dolor sit amet consectetur. Amet aenean et nunc enim ornare vulputate. Id blandit massa id dictum pellentesque. Nulla vitae aliquam massa lectus tincidunt tortor. Quisque diam.",
                            expandText: 'More',
                            collapseText: 'Less',
                            maxLines: 3,
                            style: TextStyle(color: Colors.white),
                            linkColor: Color(0xff2CCAA0),
                          ),
                        ),
                      ),
                    ),

                    // Menu bar on top right
                    Positioned(
                      top: 1,
                      left: 5,
                      child: PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        itemBuilder: (BuildContext context) {
                          return menuItems;
                        },
                        onSelected: (String value) {},
                      ),
                    ),

                    // left bottom
                    Positioned(
                      bottom: 230,
                      right: 00,
                      child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: Colors.transparent,
                        child: Column(
                          children: [
                            const CircleImage(
                              imageProvider:
                                  AssetImage('assets/images/profile.png'),
                              size: 35,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    // Handle comment icon tap
                                  },
                                  icon: const Icon(
                                    Icons.favorite_sharp,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                                const Text(
                                  "45k",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showComment = !showComment;
                                      if (showComment) {
                                        _showComments(_scaffoldCtx);
                                        print("------------ displayed");
                                      } else {
                                        Navigator.pop(_scaffoldCtx);
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.comment,
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    size: 35,
                                  ),
                                ),
                                const Text(
                                  "45k",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _isHidden = !_isHidden;
                                });
                              },
                              icon: const Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/hide.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        bottomNavigationBar: bottomNav());
  }

  void _showComments(scaffoldCtx) {
    Navigator.of(context, rootNavigator: true);
    sheetController = showBottomSheet(
        context: scaffoldCtx,
        builder: (BuildContext bc) {
          return commentCard(context);
        });
    sheetController.closed.then((value) {
      setState(() {
        showComment = false;
      });
    });
  }
}
