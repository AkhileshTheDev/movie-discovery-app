# movie-discovery-app

A simple Flutter app that allows users to search for movies, view detailed information, and manage a list of favorite movies using the OMDb API.

## Getting Started

This Flutter app enables users to search for movies and view their details using data fetched from the OMDb API. Additionally, users can save movies to a favorites list, which is stored locally.

## Installation & Setup

Prerequisites
Flutter SDK (installation guide)
A code editor like VSCode or Android Studio
An OMDb API key (you can get it from OMDb API)


## Clone the Repository

git clone https://github.com/AkhileshTheDev/movie-discovery-app.git

## Install Dependencies

flutter pub get

## Add Your OMDb API Key

filename:  api_urls.dart
String apikey = "your_api_key_here";

## Running the App

flutter run

## Usage

Searching for Movies
Open the app and enter the title of the movie you want to search for in the search bar.
The app will display a list of matching movies fetched from the OMDb API.
Viewing Movie Details
Select a movie from the search results to view detailed information, including the poster, plot, release date, and more.
Managing Favorite Movies
On the movie details screen, you can add the movie to your favorites.
Access your saved favorites from the favorites screen.

## APIs Used

OMDb API: This app fetches movie data using the OMDb API. For more details, visit the OMDb API Documentation.
http://www.omdbapi.com/
