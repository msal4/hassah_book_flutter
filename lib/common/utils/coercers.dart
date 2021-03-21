import 'package:dio/dio.dart';

DateTime fromGraphQLDateTimeToDartDateTime(String date) => DateTime.parse(date);
String fromDartDateTimeToGraphQLDateTime(DateTime date) =>
    date.toIso8601String();

MultipartFile fromGraphQLUploadToDartMultipartFile(MultipartFile file) => file;
MultipartFile fromDartMultipartFileToGraphQLUpload(MultipartFile file) => file;
