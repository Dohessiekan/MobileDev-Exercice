import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Coursework extends StatefulWidget {
  const Coursework({Key? key}) : super(key: key);

  @override
  _CourseworkState createState() => _CourseworkState();
}
                                 
class _CourseworkState extends State<Coursework> {
  bool isFavorite = false;

  // Replace with your own YouTube video ID
  final String videoId = '2S9oO8MQi0o'; // Example video ID

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 51, 132, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: const Color(0xFF303384),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              // Handle back button press if needed
            },
          ),
          title: Text(
            'Coursework',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Fira Sans',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/edquest.png'),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'UI UX Design',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Fira Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.star : Icons.star_border,
                      color: isFavorite ? Colors.yellow : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Week 1, Lesson 1:\nDesign\nwith the user in mind',
                            style: TextStyle(
                              color: Color(0xFFF9B32D),
                              fontFamily: 'Fira Sans',
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Text(
                          'UI UX Design Defined',
                          style: TextStyle(
                            color: Color(0xFF242C6D),
                            fontFamily: 'Fira Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
                          child: Text(
                            'UI/UX Design is the process of creating user interfaces and experiences that are visually appealing, easy to navigate, and provide a satisfying user experience.',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Fira Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        // YouTube Player Widget
                        YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Color(0xFF242C6D),
                          progressColors: ProgressBarColors(
                            playedColor: Color(0xFF242C6D),
                            handleColor: Color(0xFF242C6D),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                          child: Text(
                            'Summary',
                            style: TextStyle(
                              color: Color(0xFF242C6D),
                              fontFamily: 'Fira Sans',
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Text(
                          'The video "What is UI vs. UX Design?" explains the distinct roles of UI (User Interface) and UX (User Experience) designers. UX designers focus on improving the functionality and user flow of an application, ensuring a logical and enjoyable user experience. UI designers handle the visual aspects, such as design, animations, and transitions. Both roles require collaboration with product managers, engineers, and clients. The video also mentions average salaries for these positions and recommends Zero to Mastery\'s designer bootcamp for aspiring designers.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Fira Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  side: BorderSide(width: 1.0, color: Colors.grey),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 15,
                                  ),
                                ),
                                onPressed: () {
                                  // Handle Before button press
                                },
                                child: Text(
                                  'Before',
                                  style: TextStyle(
                                    color: Color(0xFF303384),
                                    fontSize: 18,
                                    fontFamily: 'Fira Sans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF303384),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 15,
                                  ),
                                ),
                                onPressed: () {
                                  // Handle Next button press
                                },
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Fira Sans',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

