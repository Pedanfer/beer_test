import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final List<Widget>? actions;
  final String title;
  const CustomScaffold({
    super.key,
    required this.body,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        actions: actions ?? [],
      ),
      body: body,
    );
  }
}
