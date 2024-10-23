import 'package:MovieDiscoveryApp/ResponseModels/MoviesDataResponseModel.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

// A StatelessWidget to display a popular movie
class PopularMovie extends StatelessWidget {
  final Movies movie; // The movie data to display

  const PopularMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 18, right: 18), // Padding around the container
      child: Row(
        children: [
          // Card to display the movie poster
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners for the card
            ),
            elevation: 8.0, // Shadow effect for the card
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Round the image corners
              child: CachedNetworkImage(
                imageUrl: movie.poster ?? '', // URL for the movie poster
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()), // Loading indicator
                errorWidget: (context, url, error) => const Icon(Icons.broken_image), // Error icon if loading fails
                width: 90, // Width of the image
                height: 120, // Height of the image
                fit: BoxFit.cover, // Cover the whole space
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 12, top: 10), // Padding for text container
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space out items in the column
                children: [
                  Wrap(
                    children: [
                      Text(
                        movie.title ?? '', // Movie title
                        style: Theme.of(context).textTheme.titleMedium, // Text style from theme
                        maxLines: 2, // Limit to 2 lines
                        overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows
                      ),
                    ],
                  ),
                  Wrap(
                    children: [
                      Text(
                        movie.year ?? '', // Movie release year
                        style: Theme.of(context).textTheme.titleSmall, // Text style from theme
                        maxLines: 2, // Limit to 2 lines
                        overflow: TextOverflow.ellipsis, // Show ellipsis if text overflows
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Spacer
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
