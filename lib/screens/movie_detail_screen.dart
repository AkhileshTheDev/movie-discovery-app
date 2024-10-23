import 'package:MovieDiscoveryApp/BlocProvider/Movie_Detail_Bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatefulWidget {
  final String imdbID; // IMDB ID of the movie, passed from the previous screen

  MovieDetailScreen({required this.imdbID});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();
    apiCalling(); // Fetch movie details when the screen is initialized
  }

  // Method to fetch movie details from the API
  apiCalling() async {
    // Dispatch event to load movie details using the provided imdbID
    BlocProvider.of<MovieDetailBloc>(context).add(
        MovieDetailRefreshEvent(widget.imdbID));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movie Details', // App bar title
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false, // Align title to the left
      ),
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          // Show loading indicator while fetching movie details
          if (state is MovieDetailLoadingState) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.14),
                child: const CircularProgressIndicator(), // Loading spinner
              ),
            );
          }

          // Show error message if an error occurred
          if (state is MovieDetailErrorState) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.14),
                child: const Text(
                  "Something went wrong", // Error message
                ),
              ),
            );
          }

          // Display movie details if data was fetched successfully
          if (state is MovieDetailSuccessState) {
            final movie = state.MoviesData; // Get movie data
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView( // Allow scrolling for long content
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Display movie poster, or an empty space if not available
                    movie!.Poster.isNotEmpty
                        ? Image.network(movie.Poster, height: 250) // Load poster image
                        : const SizedBox(height: 250), // Placeholder if no poster

                    const SizedBox(height: 16), // Spacer

                    // Display movie title
                    Text(
                      movie.Title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8), // Spacer

                    // Display other movie details
                    Text('Year: ${movie.Year}'),
                    Text('Genre: ${movie.Genre}'),
                    Text('Director: ${movie.Director}'),
                    const SizedBox(height: 16), // Spacer

                    // Section title for the plot
                    const Text(
                      'Plot',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8), // Spacer

                    // Display movie plot
                    Text(movie.Plot),
                    const SizedBox(height: 16), // Spacer

                    // Display IMDB rating
                    Text('IMDB Rating: ${movie.imdbRating}'),
                  ],
                ),
              ),
            );
          }
          return Container(); // Default return if no state matches
        },
      ),
    );
  }
}
