import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_line/src/cubit/state.dart';

import '../data/repositories/ortho_repository.dart';

class OrthoCubit extends Cubit<OrthoState> {
  final OrthoRepository _repository;
  bool _hasLoaded = false;

  OrthoCubit(this._repository) : super(OrthoInitial());

  Future<void> loadOrthoData() async {
    // Prevent multiple simultaneous loads
    if (state is OrthoLoading) return;

    // If already loaded, don't reload
    if (_hasLoaded && state is OrthoLoaded) return;

    try {
      emit(OrthoLoading());
      final data = await _repository.getOrthoData();
      _hasLoaded = true;
      emit(OrthoLoaded(data));
    } catch (e) {
      emit(OrthoError(e.toString()));
    }
  }

  // Method to force reload data
  Future<void> reloadOrthoData() async {
    _hasLoaded = false;
    await loadOrthoData();
  }
}
