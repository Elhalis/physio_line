import '../models/ortho/ortho.dart';
import '../services/local_storage_service.dart';

class OrthoRepository {
  final OrthoService _service;

  OrthoRepository(this._service);

  Future<Ortho> getOrthoData() async {
    return await _service.fetchOrthoData();
  }
}
