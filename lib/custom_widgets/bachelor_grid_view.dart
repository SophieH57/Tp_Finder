import 'package:finder/models/bachelor.dart';
import 'package:finder/utils/get_methods.dart';
import 'package:finder/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BachelorGridView extends StatelessWidget {
  final Bachelor bachelor;

  const BachelorGridView({required this.bachelor, super.key});

  @override
  Widget build(BuildContext context) {
    List<Bachelor> liked =
        context.watch<BachelorsFavoritesProvider>().getBachelorsFavorites;

    final currentRouteName = ModalRoute.of(context)?.settings.name;

    return GestureDetector(
      onTap: () => context.go('/bachelor/${bachelor.id}'),
      child: Card(
        elevation: 10.0,
        color: getBackgroundColorAccordingToGender(bachelor.gender),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Provider.of<BachelorsFavoritesProvider>(context,
                      listen: false)
                  .toggleFavoritesBachelor(bachelor),
              icon: Icon(
                Icons.favorite,
                color: (liked.contains(bachelor) ? Colors.red : Colors.grey),
              ),
            ),
            Image.asset(
              bachelor.avatar,
              height: 100,
              width: 100,
            ),
            Text(
              '${bachelor.firstname} ${bachelor.lastname}',
              style: TextStyle(
                  color: getTextColorAccordingToGender(bachelor.gender),
                  fontWeight: FontWeight.bold),
            ),
            currentRouteName == 'favorites'
                ? IconButton(
                    icon: const Icon(Icons.thumb_down),
                    onPressed: () {
                      Provider.of<BachelorsFavoritesProvider>(context,
                              listen: false)
                          .deleteFavoriteBachelor(bachelor);
                    },
                  )
                : Container(),
            currentRouteName == 'favorites'
                ? Container()
                : IconButton(
                    icon: const Icon(Icons.dangerous, color: Colors.black),
                    onPressed: () => {
                      Provider.of<BachelorsProvider>(context, listen: false)
                          .addDislike(bachelor)
                    },
                    tooltip: 'Blacklist',
                  ),
          ],
        ),
      ),
    );
  }
}
