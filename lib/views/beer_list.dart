import 'package:flutter/material.dart';
import 'package:test/models/item_view_model.dart';
import 'package:test/widgets/custom_scaffold.dart';

import '../api/api.dart';
import '../widgets/beer_list_item.dart';

class BeerList extends StatefulWidget {
  const BeerList({super.key});

  @override
  State<BeerList> createState() => _BeerListState();
}

class _BeerListState extends State<BeerList> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Best beers in the world!",
      body: FutureBuilder<List<BeerViewModel>>(
          future: Api.getBeerList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return (const Center(
                child: CircularProgressIndicator(),
              ));
            } else if (snapshot.hasError || snapshot.data == null) {
              return (const Center(
                child: Text("Error obtaining beers from server."),
              ));
            } else if (snapshot.data!.isEmpty) {
              return (const Center(
                child: Text("Your search returned no beers."),
              ));
            }
            return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (_, i) =>
                    BeerListItem(viewModel: snapshot.data![i]),
                separatorBuilder: (_, i) => const SizedBox(height: 16),
                itemCount: snapshot.data!.length);
          }),
    );
  }
}
