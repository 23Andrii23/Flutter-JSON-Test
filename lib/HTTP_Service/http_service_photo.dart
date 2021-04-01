import 'dart:convert';
import 'package:flutter_app_json/Model/photos_model.dart';
import 'package:http/http.dart';

class HttpServicePhotos {


  Future<List<Photos>> getAlbums(int albumId) async {
    final photosUrl = Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId');
    Response res = await get(photosUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Photos> photos =
          body.map((dynamic item) => Photos.fromJson(item)).toList();

      return photos;
    } else {
      throw "Can't get photos";
    }
  }
}
