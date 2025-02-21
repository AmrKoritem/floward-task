import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class UploadRequest {
  String url;
  Map<String, String>? headers;
  final Map<String, dynamic> _parameters;
  final List<File> uploadedFiles;
  final String uploadedFilesKey;
  final MediaType? contentType;

  UploadRequest({
    required this.url,
    this.headers,
    Map<String, dynamic>? otherParameters,
    required this.uploadedFiles,
    this.uploadedFilesKey = 'file',
    this.contentType,
  }) : _parameters = otherParameters ?? {};

  Future<FormData?> makeFormData(int index) async {
    if (index >= uploadedFiles.length || index < 0) {
      throw ('Invalid index provided');
    }
    final multiPartFile = await MultipartFile.fromFile(
      uploadedFiles.elementAt(index).path,
      contentType: contentType,
    );
    return FormData.fromMap({
      uploadedFilesKey: multiPartFile,
      ..._parameters,
    });
  }
}
