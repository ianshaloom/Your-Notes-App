import 'package:flutter/material.dart';

class Folders {
  late final String title;
  late final String totalNotes;
  late final String description;
  late final Color color;
  late final List<Object>? notes;

  Folders({
    this.notes,
    required this.title,
    required this.totalNotes,
    required this.description,
    required this.color,
  });
}
