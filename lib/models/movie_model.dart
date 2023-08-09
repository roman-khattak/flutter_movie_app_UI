class Movie {
  final String name;
  final String imagePath; // "imagePath" is where we have the image url for background image of video
  final String videoPath; // where we have the videos URLs
  final String category; // where we have the category of the video
  final int year;
  final Duration duration;


  Movie({
    /// We pass all the above information into this constructor and make it a @required parameter
    required this.name,
    required this.imagePath,
    required this.videoPath,
    required this.category,
    required this.year,
    required this.duration,
  });

  /// Here we also create a Static List of movies so that we have some sample data to use in our app
  static List<Movie> movies = [
    Movie(
      name: 'Hustle',
      imagePath: 'https://images.unsplash.com/photo-1620439032938-aadc7c683c8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      //videoPath: 'assets/videos/sampleVideo.mp4',
      videoPath: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      category: 'Drama',
      year: 2022,
      duration: Duration(hours: 1, minutes: 58),
    ),

    Movie(
      name: 'Action',
      imagePath: 'https://images.unsplash.com/photo-1590962677400-f97466952836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      //videoPath: 'assets/videos/sampleVideo.mp4',
      videoPath: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      category: 'Action',
      year: 2023,
      duration: Duration(hours: 2, minutes: 15),
    ),
    Movie(
      name: 'Romantic',
      imagePath: 'https://images.unsplash.com/photo-1550155888-430386a434b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fHJvbWFuY2V8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      //videoPath: 'assets/videos/sampleVideo.mp4',
      videoPath: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      category: 'Romance',
      year: 2022,
      duration: Duration(hours: 1, minutes: 45),
    ),
    Movie(
      name: 'Comedy',
      imagePath: 'https://www.kindpng.com/picc/m/281-2813299_transparent-happy-woman-png-smile-cartoon-girl-face.png',
      //videoPath: 'assets/videos/sampleVideo.mp4',
      videoPath: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      category: 'Comedy',
      year: 2022,
      duration: Duration(hours: 1, minutes: 30),
    ),
    Movie(
      name: 'Thriller',
      imagePath: 'https://images.unsplash.com/photo-1554130666-d400f75197ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=396&q=80',
      //videoPath: 'assets/videos/sampleVideo.mp4',
      videoPath: 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 30),
    ),
    Movie(
      name: 'Horror',
      imagePath: 'https://images.unsplash.com/photo-1597739239353-50270a473397?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8aG9ycm9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
     // videoPath: 'assets/videos/sampleVideo.mp4',
      videoPath: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      category: 'Thriller',
      year: 2022,
      duration: Duration(hours: 1, minutes: 30),
    ),
  ];
}
