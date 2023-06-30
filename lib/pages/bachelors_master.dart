import 'package:finder/custom_widgets/bachelor_preview.dart';
import 'package:finder/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../models/bachelor.dart';

class BachelorsMaster extends StatelessWidget {
  const BachelorsMaster({super.key});

  @override
  Widget build(BuildContext context) {
    bool femaleSelected = context.watch<BachelorsProvider>().getFemaleSelect;
    bool maleSelected = context.watch<BachelorsProvider>().getMaleSelect;

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
                    .toggleGender(Gender.female)
              },
              icon: Icon(
                Icons.female,
                color: femaleSelected ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () => {
                Provider.of<BachelorsProvider>(context, listen: false)
                    .toggleGender(Gender.male)
              },
              icon: Icon(
                Icons.male,
                color: maleSelected ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () => context.go('/favorites'),
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            TextField(
              onChanged: (value) =>
                  Provider.of<BachelorsProvider>(context, listen: false)
                      .searchBachelorByFirstname(value),
              showCursor: true,
              cursorColor: Colors.purple[700],
              decoration:
                  const InputDecoration(hintText: 'Search by firstname...'),
              // onTapOutside: (event) => emptyTextField(),
            ),
            Consumer<BachelorsProvider>(
              builder: (context, BachelorsProvider bachelorsProvider, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: bachelorsProvider.getAuthorized.length,
                    itemBuilder: ((context, index) {
                      final Bachelor bachelor =
                          bachelorsProvider.getAuthorized[index];

                      return Dismissible(
                        key: Key(bachelor.id!),
                        child: BachelorPreview(bachelor: bachelor),
                        onDismissed: (direction) {
                          Provider.of<BachelorsProvider>(context, listen: false)
                              .addDislike(bachelor);
                        },
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
