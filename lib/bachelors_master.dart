import 'package:finder/custom_widgets/bachelor_preview.dart';
import 'package:finder/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BachelorsMaster extends StatefulWidget {
  const BachelorsMaster({super.key});

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Finder'),
          actions: <Widget>[
            IconButton(
                onPressed: () => context.go('/favorites'),
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
        ),
        body: Consumer<BachelorsDislikeProvider>(
          builder: (context, value, child) {
            final authorizedBachelors = value.getAuthorized;
            // print(authorizedBachelors.length);
            // final dislike = value.getBachelorsDislike;
            // print(dislike);

            return ListView.builder(
                itemCount: authorizedBachelors.length,
                itemBuilder: ((context, index) {
                  return Consumer<BachelorsDislikeProvider>(
                      builder: (context, value, child) {
                    final authorizedBachelors = value.getAuthorized;
                    print(authorizedBachelors.length);
                    return BachelorPreview(
                        bachelorId: authorizedBachelors[index].id);
                  });
                }));
          },
        ));
  }
}
