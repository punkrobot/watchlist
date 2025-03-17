import 'package:flutter/material.dart';

class GenreLabel extends StatelessWidget {
  final String genre;

  const GenreLabel({super.key, required this.genre});

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Text(
          genre,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
