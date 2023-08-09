import 'package:flutter/material.dart';

import '../models/movie_model.dart';
import '../widgets/movie_list_item.dart';
import 'movie_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//first we need to declare a list variable inside the build method and store the list of movies on it.
    List<Movie> movies = Movie.movies;  // "movies" list is a static variable so we access it directly through class name

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: _CustomClipper(),
          child: Container(   // //this container will be clipped based on our CustomClipper
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xFF000B49),
            child: Center(    // to align the Text widget at the center of the appBar
              child: Text(
                  'Explore',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
              ),
            ),
          ),
        ),
      ),

      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(  //Now we will prepare the listView that will contain all our videos
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 150.0
          ),
          child: Column(
            children: [
              RichText(   // before displaying the Cards of videos we will add some text in the body above so that we can define which section it is
                  text: TextSpan(style: Theme.of(context).textTheme.titleLarge,
          children: [
            TextSpan(
                text: 'Featured ',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold
              )
            ),

            const TextSpan(text: 'Movies'),
          ],
              ),
              ),

              const SizedBox(height: 20),
//we are going to iterate through a list of movies and for each of the movie we will create a custom Card which will be MovieListItem in which i will pass some information related to the movie
              for (final movie in movies)     // This loop generates a separate object at a time so when you click a card in the UI it will be a specific object that is clicked and its data can also be passed to next scren
                 InkWell(
                   onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return MovieScreen(movie: movie);
                     },));
                   },

                   child: MovieListItem(
                    imageUrl: movie.imagePath,
                   name: movie.name,
                   information: '${movie.year} | ${movie.category} | ${movie.duration.inHours}h |${movie.duration.inMinutes.remainder(60)}m'
                ),
                 ),
            ],
          ),
        ),
      )
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;   // providing total height of the appbar
    double width = size.width;     // providing total width of the appbar

    var path = Path();

    path.lineTo(0, height - 50);   // from topLeft to bottomLeft until totalHeight - 50 an endpoint is created
    path.quadraticBezierTo(width / 2, height, width, height - 50);  // to create our curved line we use this function where we first provide "where we want the line to end" and then "the control point through which we want our line to pass"
    path.lineTo(width, 0);
    path.close();

    return path;

  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}