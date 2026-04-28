import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

abstract final class SyncSectionRequest {
  static Future<FormData> build({
    String? text,
    Map<String, dynamic>? content,
    String? transcription,
    Map<String, dynamic>? aiSuggested,
    File? audio,
  }) async {
    return FormData.fromMap({
      if (text != null) 'text': text,
      if (content != null) 'content': jsonEncode(content),
      if (transcription != null) 'transcription': transcription,
      if (aiSuggested != null) 'ai_suggested': jsonEncode(aiSuggested),
      if (audio != null)
        'audio': await MultipartFile.fromFile(
          audio.path,
          filename: audio.uri.pathSegments.last,
        ),
    });
  }
}
