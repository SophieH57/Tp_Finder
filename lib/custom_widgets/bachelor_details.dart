import 'package:finder/main.dart';
import 'package:finder/utils/get_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/bachelor.dart';

class BachelorDetails extends StatefulWidget {
  final int bachelorId;
  const BachelorDetails({required this.bachelorId, super.key});

  @override
  State<BachelorDetails> createState() => _BachelorDetailsState();
}

class _BachelorDetailsState extends State<BachelorDetails> {
  late int bachelorId;

  bool _liked = false;

  @override
  void initState() {
    bachelorId = widget.bachelorId;
    super.initState();
  }

  SnackBar snackBar(Bachelor bachelor) => SnackBar(
        content: Text(
          _liked
              ? 'Vous avez liké ${bachelor.firstname}'
              : 'Vous ne likez plus ${bachelor.firstname}',
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: _liked ? Colors.red : Colors.grey,
      );

  @override
  Widget build(BuildContext context) {
    Bachelor bachelor = getBachelorById(bachelorId);

    void isLiked() {
      setState(() {
        _liked = !_liked;
      });
      ScaffoldMessenger.of(context).showSnackBar(snackBar(bachelor));
      Provider.of<BachelorsFavoritesProvider>(context, listen: false)
          .addFavoritesBachelor(bachelor);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: getBackgroundColorAccordingToGender(bachelor.gender),
        title: Text(
          '${bachelor.firstname} ${bachelor.lastname}',
          style:
              TextStyle(color: getTextColorAccordingToGender(bachelor.gender)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(bachelor.avatar,
                        height: 200, width: 200, alignment: Alignment.center),
                    Icon(
                      Icons.favorite,
                      color: _liked
                          ? Colors.red.withOpacity(0.75)
                          : Colors.grey.withOpacity(0.5),
                      size: 80,
                    )
                  ],
                ),
                Text('${bachelor.firstname} ${bachelor.lastname}',
                    style: TextStyle(
                        color: getTextColorAccordingToGender(bachelor.gender),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            getTextColorAccordingToGender(bachelor.gender))),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Icons.work,
                      weight: 30,
                      size: 30,
                      color: getTextColorAccordingToGender(bachelor.gender)),
                  Text(bachelor.job!),
                ]),
                Text(bachelor.description!),
                GestureDetector(
                  onTap: () => isLiked(),
                  child: Icon(
                    _liked ? Icons.thumb_down : Icons.thumb_up,
                    color: _liked ? Colors.grey : Colors.red,
                  ),
                )
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        tooltip: 'Return',
        child: const Icon(Icons.reply_outlined),
      ),
    );
  }
}
