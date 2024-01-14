import 'package:uuid/uuid.dart';

String getManifest(String name, String description) {
  final uuid1 = const Uuid().v4();
  final uuid2 = const Uuid().v4();
  final uuid3 = const Uuid().v4();
  return '''
{
  "format_version": 2,
  "header": {
    "name": "$name",
    "description": "$description",
    "uuid": "$uuid1",
    "min_engine_version": [1, 19, 50],
    "version": [1, 0, 0]
  },
  "modules": [
    {
      "type": "data",
      "uuid": "$uuid2",
      "version": [1, 0, 0]
    },
    {
      "type": "script",
      "uuid": "$uuid3",
      "entry": "scripts/index.js",
      "version": [1, 0, 0]
    }
  ],
  "dependencies": [
    {
      "module_name": "@minecraft/server",
      "version": "1.9.0-beta"
    }
  ]
}
  ''';
}
