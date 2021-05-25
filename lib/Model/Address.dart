
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Address{
  final String Location;
  final String FullAddress;
  final String State;
  final String Pin;
  final String City;

  Address({this.Location, this.FullAddress, this.State, this.Pin, this.City});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

}





Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    Location: json['Location'] as String,
    FullAddress: json['FullAddress'] as String,
    State: json['State'] as String,
    Pin: json['Pin'] as String,
    City: json['City'] as String,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'Location': instance.Location,
  'FullAddress': instance.FullAddress,
  'State': instance.State,
  'Pin': instance.Pin,
  'City': instance.City,
};