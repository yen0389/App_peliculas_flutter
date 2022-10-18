import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Peliculas en Cines')),
        elevation: 0,
        actions: [
          IconButton(
            icon:  Icon( Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate() ),
          )
        ],
      ),
      body: SingleChildScrollView(

        child: Column(
              children: [

                CardSwiper( movies: moviesProvider.onDisplayMovies ),

                //Slider de peliculas
                MovieSlider(
                  movies: moviesProvider.popularMovies,
                  title: 'Populares',
                  onNextPage: () => moviesProvider.getPopularMovies(),
                ),


              ],
            )
        ),
      );
  }


}