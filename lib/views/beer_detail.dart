import 'package:flutter/material.dart';
import 'package:test/models/item_view_model.dart';

import '../widgets/custom_scaffold.dart';

class BeerDetail extends StatelessWidget {
  final BeerViewModel viewModel;
  const BeerDetail({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: viewModel.name,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 24, top: 24),
                child: viewModel.displayPhoto(320)),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 24),
                child: Text(viewModel.description, textAlign: TextAlign.start),
              ),
            )
          ],
        ),
      ),
    );
  }
}
