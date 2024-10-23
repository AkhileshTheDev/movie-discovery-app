import 'package:MovieDiscoveryApp/screens/movie_detail_screen.dart';
import 'package:MovieDiscoveryApp/screens/widgets/movie_card.dart';
import 'package:MovieDiscoveryApp/widgets/animated_scroll_view_item.dart';
import 'package:MovieDiscoveryApp/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../BlocProvider/Movies_Bloc.dart';
import '../utils/app_colors.dart';
import 'Movie_search_screen.dart';

class MovieHomeScreen extends StatefulWidget {
  @override
  _MovieHomeScreenState createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  final ScrollController _scrollController = ScrollController(); // Controller for scrolling
  String searchQuery = 'Movies'; // Default search query
  int page = 1; // Current page for pagination
  bool isFetchingMore = false; // Flag to prevent multiple fetches

  @override
  void initState() {
    super.initState();
    apiCalling(); // Initial API call to fetch movies
    _scrollController.addListener(_onScroll); // Listen for scroll events
  }

  // Method to handle scroll events
  void _onScroll() {
    // Check if the scroll position is at the edge
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
        // We're at the top of the list
      } else {
        // We're at the bottom of the list
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          // Trigger pagination when reaching the end of the list
          if (!isFetchingMore) { // Prevent multiple fetch triggers
            setState(() {
              isFetchingMore = true; // Set fetching flag
            });
            // Dispatch event to fetch the next page of movies
            BlocProvider.of<MoviesBloc>(context).add(
                MoviesRefreshEvent(searchQuery, ++page)); // Increment page for next fetch
          }
        }
      }
    }
  }

  // Method to fetch movies from API
  apiCalling() async {
    // Dispatch event to load movies for the current page
    BlocProvider.of<MoviesBloc>(context).add(
        MoviesRefreshEvent("Movies", page));
  }

  @override
  Widget build(BuildContext context) {
    // Set icon color based on theme brightness
    final Color iconColor = Theme.of(context).brightness == Brightness.light
        ? AppColors.primaryLight
        : AppColors.primaryDark;

    return Scaffold(
      drawer: const AppDrawer(), // App drawer
      appBar: AppBar(
        title: Text(
          'Movies', // App title
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        leading: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer(); // Open drawer on tap
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu, // Menu icon
                  ),
                ),
              );
            }
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search), // Search icon
            onPressed: () {
              // Navigate to the search screen
              Navigator.of(context)
                  .push(MaterialPageRoute(
                  builder: (context) =>
                  const MovieSearchScreen()))
                  .then((value) {
                setState(() {
                  page = 1; // Reset page on returning from search
                });
              });
            },
          )
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          // Show loading indicator while fetching movies
          if (state is MoviesLoadingState) {
            return Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.14),
                  child: const CircularProgressIndicator(),
                ),
              ),
            );
          }

          // Show error message if an error occurred
          if (state is MoviesErrorState) {
            return Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.14),
                  child: const Text(
                    "Something went Wrong", // Error message
                  ),
                ),
              ),
            );
          }

          // Show movie list if data was fetched successfully
          if (state is MoviesSuccessState) {
            isFetchingMore = false; // Reset fetching flag
            if (state.MoviesData!.search!.isEmpty ||
                state.MoviesData!.search == null ||
                state.MoviesData!.search.toString() == "null") {
              // No data found message
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.14),
                  child: const Text(
                    "No data Found", // No data message
                  ),
                ),
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        // Space between list items
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        );
                      },
                      controller: _scrollController, // Attach scroll controller
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.MoviesData!.search!.length + 1, // Extra item for loading indicator
                      itemBuilder: (context, int index) {
                        if (index == state.MoviesData!.search!.length) {
                          // Show loading indicator at the end of the list
                          return isFetchingMore
                              ? const Center(
                            child: SizedBox(
                              height: 50,
                              width: 50,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          )
                              : const SizedBox(); // Empty space when not loading
                        } else {
                          final movie = state.MoviesData?.search?[index]; // Get movie data
                          return AnimatedScrollViewItem(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to movie detail screen on tap
                                Navigator.of(context)
                                    .push(MaterialPageRoute(
                                    builder: (context) =>
                                        MovieDetailScreen(imdbID: movie.imdbId!)));
                              },
                              child: PopularMovie(movie: movie!), // Display movie card
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            }
          }
          return Container(); // Default return if no state matches
        },
      ),
    );
  }
}
