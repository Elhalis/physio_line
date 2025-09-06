import 'package:physio_line/src/data/models/ortho_model.dart';


abstract class OrthoState {}

class OrthoInitial extends OrthoState {}

class OrthoLoading extends OrthoState {}

class OrthoLoaded extends OrthoState {
  final OrthoJoints data;
  OrthoLoaded(this.data);
}

class OrthoError extends OrthoState {
  final String message;
  OrthoError(this.message);
}
