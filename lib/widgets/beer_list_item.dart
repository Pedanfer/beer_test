import 'package:flutter/material.dart';
import 'package:test/helpers/navigation.dart';
import 'package:test/models/item_view_model.dart';
import 'package:test/views/beer_detail.dart';

class BeerListItem extends StatelessWidget {
  final BeerViewModel viewModel;
  const BeerListItem({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigator.to(
          context: context,
          widget: BeerDetail(viewModel: viewModel),
          type: NavigationType.push,
          transition: NavigationTransition.slide),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Material(
          borderRadius: BorderRadius.circular(4),
          color: const Color.fromARGB(255, 252, 242, 210),
          elevation: 1.5,
          child: Padding(
            padding: const EdgeInsets.all(8).copyWith(left: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                viewModel.displayPhoto(64),
                Column(
                  children: [
                    Text(viewModel.name),
                    const SizedBox(height: 16),
                    Text(
                      '${viewModel.description.substring(0, 50)}...',
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
