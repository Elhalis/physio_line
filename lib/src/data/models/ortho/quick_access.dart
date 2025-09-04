import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quick_access.g.dart';

@JsonSerializable()
class QuickAccess extends Equatable {
  final String? description;
  final List<dynamic>? content;

  const QuickAccess({this.description, this.content});

  factory QuickAccess.fromJson(Map<String, dynamic> json) {
    return _$QuickAccessFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuickAccessToJson(this);

  QuickAccess copyWith({String? description, List<dynamic>? content}) {
    return QuickAccess(
      description: description ?? this.description,
      content: content ?? this.content,
    );
  }

  @override
  List<Object?> get props => [description, content];
}
