import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';

class APIClient {
  dio.Dio dioClient = dio.Dio();

  Future getData({
    required String url,
    Map<String, String> headers = const {},
  }) async {
    try {
      var response =
          await dioClient.get(url, options: dio.Options(headers: headers));

      return response;
    } on SocketException catch (e) {
      debugPrint('socket' + e.toString());
    } catch (error) {
      rethrow;
    }
  }
}
