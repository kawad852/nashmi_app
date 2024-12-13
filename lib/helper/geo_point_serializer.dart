import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class GeoPointSerializer implements JsonConverter<GeoPoint?, dynamic> {
  const GeoPointSerializer();

  @override
  GeoPoint? fromJson(dynamic geoPoint) => geoPoint;

  @override
  GeoPoint? toJson(GeoPoint? data) => data;
}
