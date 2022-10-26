import 'dart:async';

import 'package:ansicolor/ansicolor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoggingInterceptor extends Interceptor {
  final AnsiPen cyanLogTextColor = new AnsiPen()..cyan();
  final AnsiPen redLogTextColor = new AnsiPen()..red();
  final AnsiPen yellowLogTextColor = new AnsiPen()..green();
  final AnsiPen magentaLogTextColor = new AnsiPen()..magenta();

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    logPrint(yellowLogTextColor('==> ${options.method} ${options.uri}'));
    logPrint('HEADERS:');
    options.headers.forEach((key, v) => printKV(' - $key', v));
    logPrint(cyanLogTextColor('REQUEST:'));
    if (options.data is FormData) {
      FormData formData = options.data as FormData;
      printAll(cyanLogTextColor(formData.fields.join('\n')));
      printAll(cyanLogTextColor(formData.files.join('\n')));
    } else {
      printAll(cyanLogTextColor(options.data ?? ""));
    }
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    logPrint('$err');
    if (err.response != null) {
      logPrint(redLogTextColor('BODY: ${err.response?.toString()}'));
    }
    logPrint(redLogTextColor(
        '<== ${err.response?.statusCode?.toString()} ${err.response?.requestOptions.uri}'));
    return err;
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    printAll(magentaLogTextColor('RESPONSE:\n${response.data ?? ""}'));

    logPrint(yellowLogTextColor(
        '<== ${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.uri}'));

    return response;
  }

  void printKV(String key, Object v) {
    logPrint('$key: $v');
  }

  void printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }

  void logPrint(String s) {
    debugPrint(s);
  }
}
