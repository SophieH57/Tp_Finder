import 'package:finder/custom_widgets/bachelor_details.dart';
import 'package:finder/main.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/get_methods.dart';

class BachelorPreview extends StatefulWidget {
  final int bachelorId;

  const BachelorPreview({required this.bachelorId, super.key});

  @override
  State<BachelorPreview> createState() => _BachelorPreviewState();
}

class _BachelorPreviewState extends State<BachelorPreview> {
  late int bachelorId;

  @override
  void initState() {
    bachelorId = widget.bachelorId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Bachelor bachelor = getBachelorById(bachelorId);

    List<Bachelor> liked =
        context.watch<BachelorsFavoritesProvider>().getBachelorsFavorites;

    final currentRouteName = ModalRoute.of(context)?.settings.name;

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BachelorDetails(
                    bachelorId: bachelor.id,
                  ))),
      child: Card(
        elevation: 10.0,
        color: getBackgroundColorAccordingToGender(bachelor.gender),
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Icon(Icons.favorite,
                color: (liked.contains(bachelor) ? Colors.red : Colors.grey)),
            Image.asset(
              bachelor.avatar,
              height: 100,
              width: 100,
            ),
            Text(
              '${bachelor.firstname} ${bachelor.lastname}',
              style: TextStyle(
                  color: getTextColorAccordingToGender(bachelor.gender)),
            ),
            IconButton(
                icon:
                    Icon(currentRouteName == 'favorites' ? Icons.delete : null),
                onPressed: () => {
                      Provider.of<BachelorsFavoritesProvider>(context,
                              listen: false)
                          .deleteFavoriteBachelor(bachelor)
                    }),
            IconButton(
                icon: const Icon(Icons.dangerous, color: Colors.black),
                onPressed: () => {
                      Provider.of<BachelorsDislikeProvider>(context,
                              listen: false)
                          .addDislike(bachelor.id)
                    })
          ]),
        ),
      ),
    );
  }
}
