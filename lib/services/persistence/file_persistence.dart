import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';

class FilePersistence {
  Future clearAll() async {
    final directory = await getApplicationDocumentsDirectory();
    directory.delete(recursive: true);
  }

  Future<Map<String, dynamic>> getObject(String key) async {
    final object = await _getObject(key);
    return object;
  }

  Future<List<dynamic>> getObjectArray(String key) async {
    final object = await _getObject(key);
    return object;
  }

  Future<dynamic> _getObject(String key) async {
    final filename = getFilename('objects', key);
    final file = await _localFile(filename);

    if (await file.exists()) {
      final objectString = await file.readAsString();
      return JsonDecoder().convert(objectString);
    }
    return null;
  }

  Future saveObject(String key, Map<String, dynamic> object) {
    return _saveObject(key, object);
  }

  Future saveObjectArray(String key, List<dynamic> object) {
    return _saveObject(key, object);
  }

  Future _saveObject(String key, Object object) async {
    print('Persisting $key');
    final filename = getFilename('objects', key);
    final file = await _localFile(filename);

    if (!await file.parent.exists()) await file.parent.create(recursive: true);

    final jsonString = JsonEncoder().convert(object);
    await file.writeAsString(jsonString);
  }

  Future<String> getString(String key) async {
    final filename = getFilename('strings', key);
    final file = await _localFile(filename);

    if (await file.exists()) return await file.readAsString();
    return null;
  }

  void saveString(String key, String value) async {
    final filename = getFilename('strings', key);
    final file = await _localFile(filename);

    if (!await file.parent.exists()) await file.parent.create(recursive: true);

    await file.writeAsString(value);
  }

  Future<Uint8List> getImage(String key) async {
    final filename = getFilename('images', key);
    final file = await _localFile(filename);

    if (await file.exists()) return await file.readAsBytes();
    return null;
  }

  Future<String> saveImage(String key, Uint8List image) async {
    final filename = getFilename('images', key);
    final file = await _localFile(filename);
    if (!await file.parent.exists()) await file.parent.create(recursive: true);

    await file.writeAsBytes(image);
    return filename;
  }

  Future<File> getAudioFile(String key) async {
    final filename = getFilename('audios', key);
    final file = await _localFile(filename);
    if (!await file.parent.exists()) await file.parent.create(recursive: true);
    return file;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  String getFilename(String type, String key) {
    return '$type/$key';
  }
}
