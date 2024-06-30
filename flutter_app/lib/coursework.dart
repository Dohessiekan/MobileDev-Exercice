import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Coursework extends StatefulWidget {
  const Coursework({Key? key}) : super(key: key);

  @override
  _CourseworkState createState() => _CourseworkState();
}

class _CourseworkState extends State<Coursework> {
  bool isFavorite = false; // State variable to manage the favorite status of the course

  // Replace with your own YouTube video ID
  final String videoId = '2S9oO8MQi0o'; // Example YouTube video ID for the course

  late YoutubePlayerController _controller; // Controller for the YouTube video player

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: videoId, // Initialize the YouTube player with the video ID
      flags: YoutubePlayerFlags(
        autoPlay: false, // Video does not play automatically
        mute: false, // Video is not muted
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the YouTube player controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 51, 132, 1), // Background color of the screen
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Height of the AppBar
        child: AppBar(
          backgroundColor: const Color(0xFF303384), // AppBar background color
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Back arrow icon
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous page
            },
          ),
          title: Text(
            'Coursework', // Title of the AppBar
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Fira Sans', // Font family for the AppBar title
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CircleAvatar(
              radius: 20, // Size of the profile avatar
              backgroundImage: AssetImage('assets/edquest.png'), // Profile avatar image
            ),
            SizedBox(width: 10), // Space between the profile avatar and the edge of the AppBar
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0), // Padding from the top of the screen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start of the column
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.0), // Padding between the title and the favorite button
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between title and favorite button
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0), // Padding on the left of the course title
                    child: Text(
                      'UI UX Design', // Course title
                      style: TextStyle(
                        color: Colors.white, // Course title color
                        fontFamily: 'Fira Sans', // Font family for the course title
                        fontWeight: FontWeight.bold,
                        fontSize: 24, // Font size for the course title
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.star : Icons.star_border, // Toggle between filled and border star icon
                      color: isFavorite ? Colors.yellow : Colors.white, // Star color based on favorite status
                      size: 30, // Icon size
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite; // Toggle favorite status on button press
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity, // Full width of the screen
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the content container
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.0), // Padding around the content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align content to the start of the column
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0), // Padding between the lesson title and the next content
                          child: Text(
                            'Week 1, Lesson 1:\nDesign\nwith the user in mind', // Lesson title
                            style: TextStyle(
                              color: Color(0xFFF9B32D), // Lesson title color
                              fontFamily: 'Fira Sans', // Font family for the lesson title
                              fontWeight: FontWeight.w900,
                              fontSize: 32, // Font size for the lesson title
                            ),
                          ),
                        ),
                        Text(
                          'UI UX Design Defined', // Subtitle for the lesson content
                          style: TextStyle(
                            color: Color(0xFF242C6D), // Subtitle color
                            fontFamily: 'Fira Sans', // Font family for the subtitle
                            fontWeight: FontWeight.bold,
                            fontSize: 25, // Font size for the subtitle
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 20.0), // Padding around the definition text
                          child: Text(
                            'UI/UX Design is the process of creating user interfaces and experiences that are visually appealing, easy to navigate, and provide a satisfying user experience.', // Definition of UI/UX Design
                            style: TextStyle(
                              color: Colors.black, // Text color for the definition
                              fontFamily: 'Fira Sans', // Font family for the definition text
                              fontWeight: FontWeight.w400,
                              fontSize: 18, // Font size for the definition text
                            ),
                          ),
                        ),
                        // YouTube Player Widget
                        YoutubePlayer(
                          controller: _controller, // YouTube player controller
                          showVideoProgressIndicator: true, // Show progress indicator for the video
                          progressIndicatorColor: Color(0xFF242C6D), // Progress indicator color
                          progressColors: ProgressBarColors(
                            playedColor: Color(0xFF242C6D), // Color of the played progress
                            handleColor: Color(0xFF242C6D), // Color of the handle
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, bottom: 10.0), // Padding around the summary section
                          child: Text(
                            'Summary', // Summary section header
                            style: TextStyle(
                              color: Color(0xFF242C6D), // Summary header color
                              fontFamily: 'Fira Sans', // Font family for the summary header
                              fontWeight: FontWeight.bold,
                              fontSize: 24, // Font size for the summary header
                            ),
                          ),
                        ),
                        Text(
                          'The video "What is UI vs. UX Design?" explains the distinct roles of UI (User Interface) and UX (User Experience) designers. UX designers focus on improving the functionality and user flow of an application, ensuring a logical and enjoyable user experience. UI designers handle the visual aspects, such as design, animations, and transitions. Both roles require collaboration with product managers, engineers, and clients. The video also mentions average salaries for these positions and recommends Zero to Mastery\'s designer bootcamp for aspiring designers.', // Summary of the video content
                          textAlign: TextAlign.justify, // Justify text alignment for readability
                          style: TextStyle(
                            color: Colors.black, // Text color for the summary
                            fontFamily: 'Fira Sans', // Font family for the summary text
                            fontWeight: FontWeight.w400,
                            fontSize: 18, // Font size for the summary text
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0), // Padding around the navigation buttons
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the navigation buttons
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white, // Background color for the Before button
                                  side: BorderSide(width: 1.0, color: Colors.grey), // Border color for the Before button
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 15,
                                  ),
                                ),
                                onPressed: () {
                                  // Handle Before button press
                                },
                                child: Text(
                                  'Before', // Text for the Before button
                                  style: TextStyle(
                                    color: Color(0xFF303384), // Text color for the Before button
                                    fontSize: 18,
                                    fontFamily: 'Fira Sans', // Font family for the Before button text
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFF303384), // Background color for the Next button
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 15,
                                  ),
                                ),
                                onPressed: () {
                                  // Handle Next button press
                                },
                                child: Text(
                                  'Next', // Text for the Next button
                                  style: TextStyle(
                                    color: Colors.white, // Text color for the Next button
                                    fontSize: 18,
                                    fontFamily: 'Fira Sans', // Font family for the Next button text
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
