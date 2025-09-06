import 'package:physio_line/src/data/models/ortho_model.dart';

import '../services/local_storage_service.dart';

abstract class IOrthoRepository {
  Future<OrthoJoints> getOrthoData();
}



class OrthoRepository implements IOrthoRepository {
  final LocalDataService _service;
  OrthoRepository(this._service);

 @override
  Future<OrthoJoints> getOrthoData() => _service.fetchOrthoData();
}