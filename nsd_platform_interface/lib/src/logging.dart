import 'dart:developer' as developer;

import 'nsd_platform_interface.dart';

final _logTopics = <LogTopic>[];

void _log(Object source, String message, {StackTrace? stackTrace}) {
  final name = source.runtimeType.toString();
  final datetime = DateTime.now();
  developer.log('[$datetime] $message', name: name, stackTrace: stackTrace);
}

void log(Object source, LogTopic logTopic, String Function() messageFunc,
    {StackTrace? stackTrace}) {
  if (_logTopics.contains(logTopic)) {
    _log(source, '[${logTopic.name}] ${messageFunc()}');
  }
}

void enableLogTopic(LogTopic logTopic) {
  _logTopics.add(logTopic);
}
