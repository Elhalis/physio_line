import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:physio_line/src/data/models/ortho_model.dart';

class LocalDataService {
  Future<OrthoJoints> fetchOrthoData() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/json/jsonformatter.json',
      );
      final Map<String, dynamic> data = json.decode(response);
      return OrthoJoints.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load ortho data: $e');
    }
  }
}
