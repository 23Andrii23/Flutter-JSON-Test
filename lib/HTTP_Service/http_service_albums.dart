import 'dart:convert';
import 'package:flutter_app_json/Model/albums_model.dart';
import 'package:http/http.dart';
import 'http_service_photo.dart';
import 'http_service_users.dart';

final HttpServiceUser httpServiceUser = HttpServiceUser();
final HttpServicePhotos httpServicePhotos = HttpServicePhotos();

int userId;

class HttpServiceAlbum {

  Future<List<Albums>> getUsers(int userId) async {
    final albumsUrl = Uri.parse('https://jsonplaceholder.typicode.com/albums?userId=$userId');
    Response res = await get(albumsUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Albums> albums =
          body.map((dynamic item) => Albums.fromJson(item)).toList();

      return albums;
    } else {
      throw "Can't get albums";
    }
  }
}
