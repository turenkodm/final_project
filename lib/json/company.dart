import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  // static fromJson(Map<String, dynamic> json) {
  //   return Company(
  //     name: json['name'],
  //     catchPhrase: json['catchPhrase'],
  //     bs: json['bs'],
  //   );
  // }
}