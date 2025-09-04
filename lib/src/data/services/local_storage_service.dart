import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:physio_line/src/data/models/ortho/ortho.dart';

class OrthoService {
  Future<Ortho> fetchOrthoData() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/jsons/ortho.json',
      );
      final Map<String, dynamic> data = json.decode(response);
      return Ortho.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load ortho data: $e');
    }
  }
}
