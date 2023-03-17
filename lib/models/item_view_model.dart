import 'package:flutter/material.dart';

class BeerViewModel {
  final String name;
  final String description;
  final String photoUrl;

  BeerViewModel({
    required this.name,
    required this.description,
    required this.photoUrl,
  });

  Image displayPhoto(double height) => Image.network(photoUrl, height: height);
}
