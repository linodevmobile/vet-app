import 'dart:io';

import 'package:dio/dio.dart';

abstract final class ProcessSectionRequest {
  static Future<FormData> build({
    required String section,
    File? audio,
    String? textInput,
  }) async {
    return FormData.fromMap({
      'section': section,
      if (audio != null)
        'audio': await MultipartFile.fromFile(
          audio.path,
          filename: audio.uri.pathSegments.last,
        ),
      if (textInput != null) 'text_input': textInput,
    });
  }
}
