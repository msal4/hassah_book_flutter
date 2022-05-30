import 'package:dio/dio.dart';

DateTime dateTimeFromJson(dynamic date) => DateTime.parse(date as String);
String dateTimeToJson(DateTime date) => date.toIso8601String();

MultipartFile fromGraphQLUploadToDartMultipartFile(MultipartFile file) => file;
MultipartFile fromDartMultipartFileToGraphQLUpload(MultipartFile file) => file;
