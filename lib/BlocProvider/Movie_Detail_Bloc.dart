import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ApiServices/api_services.dart'; // Importing API services for fetching movie details
import '../ResponseModels/MovieDetailResponseModel.dart'; // Importing the response model for movie details

// Abstract class representing all movie detail events
abstract class MovieDetailEvent {}

// Event for refreshing movie details based on IMDb ID
class MovieDetailRefreshEvent extends MovieDetailEvent {
  String? imdbId; // IMDb ID of the movie to fetch details for
  MovieDetailRefreshEvent(this.imdbId);
}

// Abstract class representing all movie detail states
abstract class MovieDetailState {}

// Initial state when the BLoC is first created
class MovieDetailInitialState extends MovieDetailState {}

// State indicating that the movie details are currently being loaded
class MovieDetailLoadingState extends MovieDetailState {
  MovieDetailLoadingState();
}

// State indicating a successful fetch of movie details
class MovieDetailSuccessState extends MovieDetailState {
  MovieDetailResponseModel? MoviesData; // Holds the fetched movie data

  MovieDetailSuccessState(this.MoviesData);
}

// State indicating an error occurred while fetching movie details
class MovieDetailErrorState extends MovieDetailState {
  String errorMsg; // Error message to be displayed
  MovieDetailErrorState(this.errorMsg);
}

// BLoC class to manage movie detail events and states
class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  ApiServices provider = ApiServices(); // Instance of the API services
  final blocController = StreamController.broadcast(); // Stream controller for broadcasting updates
  Stream get getStream => blocController.stream; // Stream to expose to UI
  MovieDetailResponseModel? MoviesData; // Variable to hold movie data

  // Constructor initializing the BLoC with the initial state
  MovieDetailBloc() : super(MovieDetailInitialState());

  // Map incoming events to the appropriate states
  @override
  Stream<MovieDetailState> mapEventToState(MovieDetailEvent event) async* {
    try {
      // Check if the event is a refresh event
      if (event is MovieDetailRefreshEvent) {
        yield MovieDetailLoadingState(); // Emit loading state

        var response;
        // Call the API to fetch movie details
        response = await ApiServices().getMovieDetailApi(event.imdbId!);
        if (response?.Response == "True") {
          MoviesData = null; // Clear previous data
          MoviesData = response; // Store the new data
          blocController.sink.add(MoviesData); // Broadcast the new data
          yield MovieDetailSuccessState(MoviesData); // Emit success state with the data
        } else {
          // Emit error state if the API response indicates a failure
          yield MovieDetailErrorState(response?.message ?? "Something went wrong!");
        }
      }
    } catch (error) {
      // Emit error state if an exception occurs during the API call
      yield MovieDetailErrorState(error.toString());
    }
  }
}
