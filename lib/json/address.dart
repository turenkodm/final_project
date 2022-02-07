import 'package:json_annotation/json_annotation.dart';

import 'geo.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  // static fromJson(Map<String, dynamic> json) {
  //   return Address(
  //     street: json['street'],
  //     suite: json['suite'],
  //     city: json['city'],
  //     zipcode: json['zipcode'],
  //     geo: Geo.fromJson(json['geo']),
  //   );
  // }
}
