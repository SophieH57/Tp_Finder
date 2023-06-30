import 'package:finder/custom_widgets/bachelor_grid_view.dart';
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
  bool _isViewList = true;

  void toggleViewList() {
    setState(() {
      _isViewList = !_isViewList;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Bachelor> liked =
        context.watch<BachelorsFavoritesProvider>().getBachelorsFavorites;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Favorites'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => toggleViewList(),
            icon: Icon(_isViewList ? Icons.grid_view : Icons.list),
            tooltip: _isViewList ? 'To grid view' : 'To list view',
          ),
          IconButton(
            onPressed: () {
              Provider.of<BachelorsFavoritesProvider>(context, listen: false)
                  .deleteAllFavorites();
            },
            icon: const Icon(Icons.delete_forever, color: Colors.grey),
            tooltip: 'Delete all favorites',
          )
        ],
      ),
      body: _isViewList
          ? ListView.builder(
              itemCount: liked.length,
              itemBuilder: ((context, index) {
                final Bachelor bachelor = liked[index];

                return BachelorPreview(
                  bachelor: bachelor,
                );
              }),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemCount: liked.length,
              itemBuilder: ((context, index) {
                final Bachelor bachelor = liked[index];

                return BachelorGridView(
                  bachelor: bachelor,
                );
              }),
            ),
    );
  }
}
