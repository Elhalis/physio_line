import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'special_tests.g.dart';

@JsonSerializable()
class SpecialTests extends Equatable {
  final String? description;
  final List<dynamic>? content;

  const SpecialTests({this.description, this.content});

  factory SpecialTests.fromJson(Map<String, dynamic> json) {
    return _$SpecialTestsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SpecialTestsToJson(this);

  SpecialTests copyWith({String? description, List<dynamic>? content}) {
    return SpecialTests(
      description: description ?? this.description,
      content: content ?? this.content,
    );
  }

  @override
  List<Object?> get props => [description, content];
}
