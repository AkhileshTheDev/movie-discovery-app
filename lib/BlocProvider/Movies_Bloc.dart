import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ApiServices/api_services.dart'; // Importing API services for fetching movie lists
import '../ApiServices/api_utils.dart'; // Importing utility functions for the app
import '../ResponseModels/MoviesDataResponseModel.dart'; // Importing the response model for movie data

// Abstract class representing all movie events
abstract class MoviesEvent {}

// Event for refreshing the movie list with pagination
class MoviesRefreshEvent extends MoviesEvent {
  int? pageCount; // Current page number
  String? searchName; // Search query (movie title)

  MoviesRefreshEvent(this.searchName, this.pageCount);
}

// Abstract class representing all movie states
abstract class MoviesState {}

// Initial state when the BLoC is first created
class MoviesInitialState extends MoviesState {}

// State indicating that the movie list is currently being loaded
class MoviesLoadingState extends MoviesState {}

// State indicating a successful fetch of the movie list
class MoviesSuccessState extends MoviesState {
  MoviesDataResponseModel? MoviesData; // Holds the fetched movie data

  MoviesSuccessState(this.MoviesData);
}

// State indicating an error occurred while fetching the movie list
class MoviesErrorState extends MoviesState {
  String errorMsg; // Error message to be displayed

  MoviesErrorState(this.errorMsg);
}

// BLoC class to manage movie events and states
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  AppUtils appUtils; // Instance of utility functions
  final blocController = StreamController.broadcast(); // Stream controller for broadcasting updates
  Stream get getStream => blocController.stream; // Stream to expose to UI
  MoviesDataResponseModel? MoviesData; // Variable to hold movie data

  // Constructor initializing the BLoC with the initial state and app utilities
  MoviesBloc(this.appUtils) : super(MoviesInitialState());

  // Map incoming events to the appropriate states
  @override
  Stream<MoviesState> mapEventToState(MoviesEvent event) async* {
    try {
      // Check if the event is a refresh event
      if (event is MoviesRefreshEvent) {
        if (event.pageCount == 1) {
          yield MoviesLoadingState(); // Emit loading state for the first page
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
          yield MoviesSuccessState(MoviesData); // Emit success state
        } else {
          // Emit error state if the API response indicates a failure
          yield MoviesErrorState("Something Went Wrong");
        }
      }
    } catch (error) {
      // Emit error state if an exception occurs during the API call
      yield MoviesErrorState(error.toString());
    }
  }
}
