import '../data/models/ortho/ortho.dart';

abstract class OrthoState {}

class OrthoInitial extends OrthoState {}

class OrthoLoading extends OrthoState {}

class OrthoLoaded extends OrthoState {
  final Ortho data;
  OrthoLoaded(this.data);
}

class OrthoError extends OrthoState {
  final String message;
  OrthoError(this.message);
}
