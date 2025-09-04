import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rehabilitation_progression_pyramid.g.dart';

@JsonSerializable()
class RehabilitationProgressionPyramid extends Equatable {
  final String? description;
  final List<dynamic>? content;

  const RehabilitationProgressionPyramid({this.description, this.content});

  factory RehabilitationProgressionPyramid.fromJson(Map<String, dynamic> json) {
    return _$RehabilitationProgressionPyramidFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RehabilitationProgressionPyramidToJson(this);
  }

  RehabilitationProgressionPyramid copyWith({
    String? description,
    List<dynamic>? content,
  }) {
    return RehabilitationProgressionPyramid(
      description: description ?? this.description,
      content: content ?? this.content,
    );
  }

  @override
  List<Object?> get props => [description, content];
}
