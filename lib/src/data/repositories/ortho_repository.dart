import '../models/ortho/ortho.dart';
import '../services/local_storage_service.dart';

abstract class IOrthoRepository {
  Future<Ortho> getOrthoData();
}

class OrthoRepository implements IOrthoRepository {
  final LocalDataService _service;
  OrthoRepository(this._service);

  @override
  Future<Ortho> getOrthoData() => _service.fetchOrthoData();
}

