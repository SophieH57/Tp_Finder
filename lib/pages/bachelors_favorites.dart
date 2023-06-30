import 'package:finder/custom_widgets/bachelor_preview.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BachelorsFavorites extends StatefulWidget {
  const BachelorsFavorites({super.key});

  @override
  State<BachelorsFavorites> createState() => _BachelorsFavoritesState();
}

class _BachelorsFavoritesState extends State<BachelorsFavorites> {
  @override
  Widget build(BuildContext context) {
    List<Bachelor> liked =
        context.watch<BachelorsFavoritesProvider>().getBachelorsFavorites;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Favorites'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: liked.length,
        itemBuilder: ((context, index) {
          final Bachelor bachelor = liked[index];

          return BachelorPreview(
            bachelor: bachelor,
          );
        }),
      ),
    );
  }
}
