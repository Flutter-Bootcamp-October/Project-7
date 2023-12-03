import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

Future<String> saveImage(
    {required String url, required String nameImage}) async {
  try {
    final uriImage = Uri.parse(url);
    final response = await http.get(uriImage);
    final directoryPath = await getApplicationCacheDirectory();
    final File imageFile = File("${directoryPath.path}/$nameImage.png");
    await imageFile.writeAsBytes(response.bodyBytes);
    return imageFile.path;
  } catch (error) {
    throw FormatException(error.toString());
  }
}