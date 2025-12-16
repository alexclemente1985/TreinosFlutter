import 'package:cinetopia/app/models/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          height: 120,
          decoration: BoxDecoration(
            color: Color(0xFF000000),
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: NetworkImage(movie.getPosterImage()), fit: BoxFit.cover)
          ),
          margin: EdgeInsets.only(right: 16),
        ),
        Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width-138 
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                        Text(movie.title, 
                            style: TextStyle(
                              fontSize: 18, 
                              fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,   
                              maxLines: 2,         
                            ),
                        SizedBox(height: 6,),
                        Text("Lançamento: ${movie.releaseDate}", style: TextStyle(color: Color(0xFFA5A5A5)),)
                ],
              )
          )
        ],
    );
  }
}
