import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

import '../models/movie_model.dart';

class MovieScreen extends StatelessWidget {

final Movie movie;   // 'movie' object is the required input and here the whole 'movie' object will be passed from which we will fetch imagePath,video,name,etc

  const MovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(  // these build Methods are created for clean Coding
        children: [
          //The (...) operator in Flutter is called the spread operator. It is used to expand the elements of an iterable (i.e. a list, set, or map) into a collection of individual values.
         // the (...) operator is used to expand the List<Widget> returned by the _buildBackground method into individual widgets. This allows these widgets to be included as children of another widget, for example a Stack.
          //By using the spread operator (...) to expand the list returned by _buildBackground, these three widgets can be included as children of a Stack widget, which allows them to be layered on top of each other to create a visually appealing background for the app.

          ..._buildBackground(context, movie), // this method builds a list of widgets
             _buildMovieInformation(context), // this method builds a single widget
             _buildActions(context),    // this method will build the buttons

        ],
      )
    );
  }

  List<Widget> _buildBackground(BuildContext context, Movie movie) {  // this 'method' returns a 'list of widgets'
    return [

      Container(
      height: double.infinity, //container covers full screen
      color: const Color(0xFF000B49),
    ),

      Image.network(
        movie.imagePath,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.5,
        fit: BoxFit.cover,  // through this image will cover the available space
      ),
      //Now there is a very clear and visible differentiating boundary between the image and the background color.
      //... thus to remove this clear boundary and make the transition smooth between image and background we add a gradient
      const Positioned.fill(   // is actually applied on the whole Stack which is covering the total screen thus the screen gets darkest at the 0.5 ie; 50% size of the screen while color transitioning starts from 30% of the screen
        child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Color(0xFF000B49)
                    ],
                    begin: Alignment.topCenter,  // gradient will start from topCenter
                    end: Alignment.bottomCenter, // gradient will end at bottomCenter
                    stops: [0.3,0.5]    //this 'stops' concept is explained in 'movie_list_screen'

                )
            )
        ),
      )
    ];
  }

  Positioned _buildMovieInformation(BuildContext context) {  // this method returns a Positioned Widget
  return Positioned(
    bottom: 150,   // allign the column at 150 pixels from bottom
    width: MediaQuery.of(context).size.width,   // it shall take the whole available screen width
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            movie.name,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),

          const SizedBox(height: 10),

          Text(
            '${movie.year} | ${movie.category} | ${movie.duration.inHours}h |${movie.duration.inMinutes.remainder(60)}m',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14
            ),
          ),

          const SizedBox(height: 10),

          RatingBar.builder(   //shows movie ratings
              initialRating: 3.5,
              minRating: 1, // setting minimum rating
              direction: Axis.horizontal,  //direction of stars
              allowHalfRating: true,  // you can see half star if this is true
              ignoreGestures: true,
              itemCount: 5,
              itemSize: 20,
              unratedColor: Colors.white,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              },
              onRatingUpdate: (rating) {
              }
          ),

          const SizedBox(height: 20,),

          Text(
            'You are never too old to set another goal or dream a new dream. \n Every day may not be good… but there’s something good in every day.\nThe difference between ordinary and extraordinary is that little extra.\nWhen we are open to new possibilities, we find them. Be open and skeptical of everything.',
            maxLines: 8,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                height: 1.75, color: Colors.white
            ),
          )
        ],
      ),
    ),
  );
}

  Positioned _buildActions(BuildContext context) {  // this widget returns a Positioned widget
    return Positioned(
      bottom: 50,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
                style: ElevatedButton.styleFrom(    // styling the button
                  padding: const EdgeInsets.all(15.0),
                  backgroundColor: const Color(0xFFFF7272),
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.425, 50),  // width and height respectively provided
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                ),

                onPressed: () {

                },

                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                        children: [
                          TextSpan(
                              text: 'Add to ',
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          const TextSpan(
                              text: 'Watchlist'
                          )
                        ]
                    )
                )
            ),

            const SizedBox(width: 10),

            ElevatedButton(
                style: ElevatedButton.styleFrom(    // styling the button
                  padding: const EdgeInsets.all(15.0),
                  backgroundColor: Colors.white,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.425, 50),  // width and height respectively provided
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                ),

                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return _MoviePlayer(movie : movie);    //the complete movie object will be passed from here to the next screen
                  },));
                },

                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: [
                          TextSpan(
                              text: 'Start ',
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold
                              )
                          ),
                          const TextSpan(
                              text: 'Watching'
                          )
                        ]
                    )
                )
            ),
          ],
        ),
      ),
    );
  }

}

//   ... ... ... Creating Movie Player or Video Player ... ... ... //
// ................................................................//

class _MoviePlayer extends StatefulWidget {
  const _MoviePlayer({Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  State<_MoviePlayer> createState() => _MoviePlayerState();
}

class _MoviePlayerState extends State<_MoviePlayer> {

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  int? bufferDelay;


  final List<Map<String, dynamic>> videoQualityOptions = [    {      'resolution': '720p',      'url': 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',    },    {      'resolution': '480p',      'url': 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',    },    {      'resolution': '360p',      'url': 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',    },  ];

  Map<String, dynamic> selectedVideoQualityOption = {};

  @override
  void initState() {
    super.initState();
selectedVideoQualityOption = videoQualityOptions[0];
   // videoPlayerController = VideoPlayerController.asset(widget.movie.videoPath) .. initialize() .then((value) { setState(() {
  //});}); // here we initialize the instance of 'VideoPlayerController' and also pass the 'videoPath' to it through the 'movie' object received and then call upon setState again. The [' .then() '] makes sure that the first 'image' of the video is displayed on the player even if the movie hasn't started yet
    videoPlayerController = VideoPlayerController.network(widget.movie.videoPath) .. initialize() . then((value) {
      setState(() {});
    });

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController, // initialize the 'chewieController' as well and provide it the 'videoPlayerController' to play the video and 'aspectratio' to play the video in certain sized ratio ie; // (aspectRatio: 16/9) means that the width of the widget is 16 units and the height of the widget is 9 units, or any multiple of those units.
      aspectRatio: 16/9,
      hideControlsTimer: const Duration(seconds: 3),
      autoPlay: true,
      looping: false,
      allowedScreenSleep: false,
      allowFullScreen: true,
      allowMuting: true,
      allowPlaybackSpeedChanging: true,

      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },

      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.lightBlue.shade900,
        handleColor: Colors.cyan.shade800,
        backgroundColor: Colors.grey.shade400,
        bufferedColor: Colors.blueGrey.shade700,
      ),
      controlsSafeAreaMinimum: EdgeInsets.only(bottom: 5),

    );

  }

  @override
  void dispose() {

    videoPlayerController.dispose();
    chewieController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: SafeArea(     // SafeArea is used so that the Video is visible in all parts of the screen
          child: Stack(
            children:[
              Chewie(
                controller: chewieController
            ),


    if(!videoPlayerController.value.isInitialized)
      Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white
          ),
        ),
      )
          ]
          )
      ),
    );
  }
}
