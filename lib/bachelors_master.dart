import 'package:finder/custom_widgets/bachelor_preview.dart';
import 'package:finder/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'models/bachelor.dart';

class BachelorsMaster extends StatefulWidget {
  const BachelorsMaster({super.key});

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  @override
  Widget build(BuildContext context) {
    bool femaleSelected = context.watch<BachelorsProvider>().getFemaleSelect;
    bool maleSelected = context.watch<BachelorsProvider>().getMaleSelect;
    List<Bachelor> bachelors = context.watch<BachelorsProvider>().getAuthorized;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Finder'),
          actions: <Widget>[
            const Text('Reset'),
            IconButton(
                onPressed:
                    Provider.of<BachelorsProvider>(context, listen: false)
                        .cleanList,
                icon: const Icon(Icons.refresh)),
            const Text('Select your preferences'),
            IconButton(
                onPressed: () => {
                      Provider.of<BachelorsProvider>(context, listen: false)
                          .selectGender(Gender.female)
                    },
                icon: Icon(
                  Icons.female,
                  color: femaleSelected ? Colors.black : Colors.grey,
                )),
            IconButton(
                onPressed: () => {
                      Provider.of<BachelorsProvider>(context, listen: false)
                          .selectGender(Gender.male)
                    },
                icon: Icon(
                  Icons.male,
                  color: maleSelected ? Colors.black : Colors.grey,
                )),
            IconButton(
                onPressed: () => context.go('/favorites'),
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
        ),
        body: Consumer<BachelorsProvider>(
          builder: (context, value, child) {
            // final authorizedBachelors = value.getAuthorized;
            // print(authorizedBachelors.length);
            // final dislike = value.getBachelorsDislike;
            // print(dislike);

            return ListView.builder(
                itemCount: bachelors.length,
                itemBuilder: ((context, index) {
                  return Consumer<BachelorsProvider>(
                      builder: (context, value, child) {
                    // final authorizedBachelors = value.getAuthorized;
                    print(bachelors.length);
                    return BachelorPreview(bachelorId: bachelors[index].id);
                  });
                }));
          },
        ));
  }
}
