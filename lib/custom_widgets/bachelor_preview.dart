import 'package:finder/custom_widgets/bachelor_details.dart';
import 'package:finder/main.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/get_methods.dart';

class BachelorPreview extends StatefulWidget {
  final Bachelor bachelor;

  const BachelorPreview({required this.bachelor, super.key});

  @override
  State<BachelorPreview> createState() => _BachelorPreviewState();
}

class _BachelorPreviewState extends State<BachelorPreview> {
  late Bachelor bachelor;

  @override
  void initState() {
    bachelor = widget.bachelor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Bachelor> liked = context.read<LikedList>().getLikedList;

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BachelorDetails(
                    bachelor: bachelor,
                  ))),
      child: Card(
        elevation: 10.0,
        color: getBackgroundColorAccordingToGender(bachelor.gender),
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
