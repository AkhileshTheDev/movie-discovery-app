import 'package:MovieDiscoveryApp/screens/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/PrefKeys.dart';
import '../../../utils/common_shared_preferences.dart';
import '../../../utils/validator.dart';
import '../BlocProvider/Movie_Search_Bloc.dart';
import '../utils/app_colors.dart';
import '../utils/common.dart';
import '../utils/font_textstyle.dart';
import 'movie_detail_screen.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  int pageIndex = 1; // Current page index for pagination
  int lastPage = 0; // Last page number for pagination tracking
  bool isNextPage = false; // Flag to check if there's a next page
  String defaultQuery = "Movies"; // Default search query
  final _scrollController = ScrollController(); // Controller for scroll events
  TextEditingController drinkingBuddyController = TextEditingController(); // Controller for search input
  String latitute = '', longitute = ''; // Placeholder for location (unused)
  String screen = "drinking_club_buddies"; // Screen identifier (unused)
  String userType = ""; // User type (fetched from preferences)
  bool isFetchingMore = false; // Flag to prevent multiple fetches

  // Method to refresh the page and reset pagination
  Future<void> _refreshPage() async {
    pageIndex = 1; // Reset to first page
    isFetchingMore = false; // Reset fetching flag
    // Dispatch event to fetch movies based on the default query
    BlocProvider.of<MovieSearchListBloc>(context).add(MovieSearchListRefreshEvent(pageIndex, defaultQuery));
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll); // Listen for scroll events
    apiCalling(); // Initial API call to fetch movies
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the scroll controller
    super.dispose();
  }

  // Method to handle scroll events for pagination
  void _onScroll() {
    // Check if we've reached the top or bottom of the list
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
        // We're at the top
      } else {
        // We're at the bottom
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          // Trigger pagination when reaching the end of the list
          if (!isFetchingMore) { // Prevent multiple triggers
            setState(() {
              isFetchingMore = true; // Set fetching flag
            });
            // Dispatch event to fetch the next page of movies
            BlocProvider.of<MovieSearchListBloc>(context).add(MovieSearchListRefreshEvent(++pageIndex, defaultQuery));
          }
        }
      }
    }
  }

  // Method to fetch movies based on the current query
  apiCalling() async {
    userType = await CommonSharedPreferences.getPreferences(PrefKeys.userType); // Fetch user type from shared preferences
    // Dispatch event to load movies with the current page index and query
    BlocProvider.of<MovieSearchListBloc>(context).add(MovieSearchListRefreshEvent(pageIndex, defaultQuery));
  }

  // Method to create the search text field
  textField() {
    return TextFormField(
      controller: drinkingBuddyController, // Text controller for the input field
      maxLength: Validations.emailMaxLength, // Max length for input
      inputFormatters: [Validations.nameAndYearFilterFormat], // Input formatters to validate input
      textInputAction: TextInputAction.next, // Action button on the keyboard
      keyboardType: TextInputType.name, // Input type
      cursorColor: AppColors.borderGrey, // Cursor color
      style: FontTextStyle.textFieldStyle(16), // Text style
      onChanged: (String? value) {
        // Dispatch event to search movies as user types
        BlocProvider.of<MovieSearchListBloc>(context).add(
            MovieSearchListRefreshEvent(
                pageIndex, value != null && value.isNotEmpty ? value : defaultQuery));
      },
      decoration: InputDecoration(
        counterText: '', // Remove counter text for max length
        filled: true, // Fill background
        hintText: 'Search here', // Hint text
        contentPadding: const EdgeInsets.only(left: 40.0, top: 15.0, bottom: 15.0), // Padding inside the input
        hintStyle: FontTextStyle.textStyle16med(AppColors.textGrey), // Hint text style
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 20, right: 7),
          child: Icon(Icons.search), // Search icon
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 20, left: 10),
          child: GestureDetector(
            onTap: () {
              // Clear the input and dismiss the keyboard
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.of(context).pop();
              BlocProvider.of<MovieSearchListBloc>(context).add(
                  MovieSearchListRefreshEvent(pageIndex, defaultQuery)); // Reset search
            },
            child: const Icon(Icons.cancel), // Cancel icon
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // Rounded corners
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(
          left: Common.displayWidth(context) * 0.05,
          right: Common.displayWidth(context) * 0.05,
        ),
        child: SafeArea(child: screenBody()), // Main content of the screen
      ),
    );
  }

  // Method to build the main screen body
  Widget screenBody() {
    return Column(
      children: [
        textField(), // Search input field
        const SizedBox(height: 20), // Spacer
        BlocBuilder<MovieSearchListBloc, MovieSearchListState>(
          builder: (context, state) {
            // Handle loading state
            if (state is MovieSearchListLoadingState) {
              return Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: Common.displayHeight(context) * 0.14),
                    child: Common.loadingIndicator(), // Show loading indicator
                  ),
                ),
              );
            }

            // Handle error state
            if (state is MovieSearchListErrorState) {
              return Expanded(
                child: RefreshIndicator(
                  color: AppColors.refreshIndicator,
                  onRefresh: _refreshPage, // Refresh action
                  child: Stack(
                    children: [
                      ListView(), // Empty list
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: Common.displayHeight(context) * 0.14),
                          child: const Text(
                            'No data Found', // No data message
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Handle success state
            if (state is MovieSearchListSuccessState) {
              isFetchingMore = false; // Reset fetching flag
              // Check if no movies were found
              if (state.MoviesData!.search!.isEmpty ||
                  state.MoviesData!.search == null ||
                  state.MoviesData!.search.toString() == "null") {
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.refreshIndicator,
                    onRefresh: _refreshPage, // Refresh action
                    child: Stack(
                      children: [
                        ListView(), // Empty list
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: Common.displayHeight(context) * 0.14),
                            child: const Text(
                              'No Data Found', // No data message
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: RefreshIndicator(
                    color: AppColors.refreshIndicator,
                    onRefresh: _refreshPage, // Refresh action
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        // Space between list items
                        return SizedBox(
                            height: Common.displayHeight(context) * 0.01);
                      },
                      controller: _scrollController, // Attach scroll controller
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.MoviesData!.search!.length + 1, // Extra item for loading indicator
                      itemBuilder: (context, int index) {
                        if (index == state.MoviesData!.search!.length) {
                          // Show loading indicator at the end of the list
                          return isFetchingMore
                              ? const Center(
                            child: SizedBox(height: 50, width: 50, child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            )),
                          )
                              : const SizedBox(); // Empty space when not loading
                        } else {
                          final movie = state.MoviesData?.search?[index]; // Get movie data
                          return GestureDetector(
                            onTap: () {
                              // Navigate to movie detail screen on tap
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                  builder: (context) =>
                                      MovieDetailScreen(imdbID: movie.imdbId!)));
                            },
                            child: PopularMovie(movie: movie!), // Display movie card
                          );
                        }
                      },
                    ),
                  ),
                );
              }
            }
            return Container(); // Default return if no state matches
          },
        ),
      ],
    );
  }
}
