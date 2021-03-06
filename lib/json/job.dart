import 'package:json_annotation/json_annotation.dart';

part 'job.g.dart';

@JsonSerializable()
class Job {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Job({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}
