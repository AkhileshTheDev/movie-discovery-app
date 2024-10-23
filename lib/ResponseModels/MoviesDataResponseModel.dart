// To parse this JSON data, do
//
//     final userAlbumDataResponseModel = userAlbumDataResponseModelFromJson(jsonString);

import 'dart:convert';

MoviesDataResponseModel moviesDataResponseModelFromJson(String str) => MoviesDataResponseModel.fromJson(json.decode(str));

String moviesDataResponseModelToJson(MoviesDataResponseModel data) => json.encode(data.toJson());

class MoviesDataResponseModel {
  MoviesDataResponseModel({
    this.response,
    this.totalResults,
    this.search
  });

  String? response;
  String? totalResults;

  List<Movies>? search;



  factory MoviesDataResponseModel.fromJson(Map<String, dynamic> json) => MoviesDataResponseModel(
    response: json["Response"],
    totalResults: json["totalResults"],
    search: json["Search"] == null ? [] : List<Movies>.from(json["Search"]!.map((x) => Movies.fromJson(x))),
  );


  Map<String, dynamic> toJson() => {
    "Response": response,
    "totalResults": totalResults,
    "Search": search == null ? [] : List<dynamic>.from(search!.map((x) => x.toJson())),
  };
}

class Movies {
  Movies({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  final String? title;
  final String? year;
  final String? imdbId;
  final String? type;
  final String? poster;



  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
    title: json["Title"],
    year: json["Year"],
    imdbId: json["imdbID"],
    type: json["Type"],
    poster: json["Poster"],

  );

  Map<String, dynamic> toJson() => {
    "Title": title,
    "Year": year,
    "imdbID": imdbId,
    "Type": type,
    "Poster": poster,
  };
}


