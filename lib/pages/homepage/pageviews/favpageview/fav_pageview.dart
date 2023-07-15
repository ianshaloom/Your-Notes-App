import 'package:flutter/material.dart';

import 'widgets/favourites_tile.dart';

class FavouritesPageView extends StatefulWidget {
  const FavouritesPageView({super.key});

  @override
  State<FavouritesPageView> createState() => _FavouritesPageViewState();
}

class _FavouritesPageViewState extends State<FavouritesPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      child: Stack(
        children: [
          ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) =>
                const FavouriteNoteTile(),
          ),
        ],
      ),
    );
  }
}
