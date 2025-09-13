import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/cubit/state.dart';
import 'package:flutter/foundation.dart'; // Import for debugPrint

import '../data/repositories/ortho_repository.dart';

class OrthoCubit extends Cubit<OrthoState> {
  final OrthoRepository _repository;
  bool _hasLoaded = false;

  OrthoCubit(this._repository) : super(OrthoInitial());

  Future<void> loadOrthoData() async {
    // Prevent multiple simultaneous loads
    if (state is OrthoLoading) {
      debugPrint('[Cubit] loadOrthoData: Already loading, returning.');
      return;
    }

    // If already loaded, don't reload
    if (_hasLoaded && state is OrthoLoaded) {
      debugPrint('[Cubit] loadOrthoData: Already loaded, returning.');
      return;
    }

    try {
      debugPrint('[Cubit] loadOrthoData: Emitting OrthoLoading state.');
      emit(OrthoLoading());
      final data = await _repository.getOrthoData();
      _hasLoaded = true;
      debugPrint(
        '[Cubit] loadOrthoData: Data loaded successfully. Emitting OrthoLoaded state.',
      );
      // debugPrint('[Cubit] OrthoLoaded Data: ${data.toJson()}'); // Uncomment for full data dump if needed
      emit(OrthoLoaded(data));
    } catch (e) {
      debugPrint('[Cubit] loadOrthoData: Error loading data: $e');
      emit(OrthoError(e.toString()));
    }
  }

  // Method to force reload data
  Future<void> reloadOrthoData() async {
    debugPrint('[Cubit] reloadOrthoData: Forcing reload.');
    _hasLoaded = false;
    await loadOrthoData();
  }
}
