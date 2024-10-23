import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ApiServices/api_services.dart'; // Importing API services for fetching movie lists
import '../ResponseModels/MoviesDataResponseModel.dart'; // Importing the response model for movie data

// Abstract class representing all movie search list events
abstract class MovieSearchListEvent {}

// Event for refreshing the movie search list with pagination
class MovieSearchListRefreshEvent extends MovieSearchListEvent {
  int? pageCount; // Current page number
  String? searchName; // Search query (movie title)

  MovieSearchListRefreshEvent(this.pageCount, this.searchName);
}

// Abstract class representing all movie search list states
abstract class MovieSearchListState {}

// Initial state when the BLoC is first created
class MovieSearchListInitialState extends MovieSearchListState {}

// State indicating that the movie list is currently being loaded
class MovieSearchListLoadingState extends MovieSearchListState {
  MovieSearchListLoadingState();
}

// State indicating a successful fetch of the movie search list
class MovieSearchListSuccessState extends MovieSearchListState {
  MoviesDataResponseModel? MoviesData; // Holds the fetched movie data
  int? pageCount; // Current page count

  MovieSearchListSuccessState(this.MoviesData, this.pageCount);
}

// State indicating an error occurred while fetching the movie search list
class MovieSearchListErrorState extends MovieSearchListState {
  String errorMsg; // Error message to be displayed
  MovieSearchListErrorState(this.errorMsg);
}

// BLoC class to manage movie search list events and states
class MovieSearchListBloc extends Bloc<MovieSearchListEvent, MovieSearchListState> {
  ApiServices provider = ApiServices(); // Instance of the API services
  final blocController = StreamController.broadcast(); // Stream controller for broadcasting updates
  Stream get getStream => blocController.stream; // Stream to expose to UI
  MoviesDataResponseModel? MoviesData; // Variable to hold movie data

  // Constructor initializing the BLoC with the initial state
  MovieSearchListBloc() : super(MovieSearchListInitialState());

  // Map incoming events to the appropriate states
  @override
  Stream<MovieSearchListState> mapEventToState(MovieSearchListEvent event) async* {
    try {
      // Check if the event is a refresh event
      if (event is MovieSearchListRefreshEvent) {
        if (event.pageCount == 1) {
          yield MovieSearchListLoadingState(); // Emit loading state for the first page
        }

        var response;
        // Call the API to fetch the movie list based on search query and page count
        response = await ApiServices().getMovieListApi(event.searchName!, event.pageCount!);

        if (response?.response == "True") {
          // Handle successful response
          if (event.pageCount == 1) {
            MoviesData = null; // Clear previous data for the first page
            MoviesData = response; // Store the new data
          } else {
            // Append new movie results for subsequent pages
            MoviesData?.search?.addAll(response.search ?? []);
          }
          blocController.sink.add(MoviesData); // Broadcast the updated movie data
          yield MovieSearchListSuccessState(MoviesData, event.pageCount ?? 0); // Emit success state
        } else {
          // Emit error state if the API response indicates a failure
          yield MovieSearchListErrorState(response?.message ?? "Something went wrong!");
        }
      }
    } catch (error) {
      // Emit error state if an exception occurs during the API call
      yield MovieSearchListErrorState(error.toString());
    }
  }
}
