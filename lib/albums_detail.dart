import 'package:flutter/material.dart';
import 'package:flutter_app_json/Model/albums_model.dart';
import 'package:flutter_app_json/Model/photos_model.dart';
import 'HTTP_Service/http_service_albums.dart';
import 'HTTP_Service/http_service_photo.dart';
import 'HTTP_Service/http_service_users.dart';

final HttpServiceUser httpServiceUser = HttpServiceUser();
final HttpServiceAlbum httpServiceAlbum = HttpServiceAlbum();
final HttpServicePhotos httpServicePhotos = HttpServicePhotos();

class AlbumsDetails extends StatelessWidget {
  final Albums albums;
  AlbumsDetails({this.albums});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photos"),
      ),
      body: FutureBuilder(
          future: httpServicePhotos.getAlbums(albums.id),
          builder:
              (BuildContext context, AsyncSnapshot<List<Photos>> snapshot) {
            if (snapshot.hasData) {
              List<Photos> photos = snapshot.data;
              return ListView(
                padding: EdgeInsets.all(30),
                children: photos
                    .map((Photos photos) => Card(
                      child: Column(
                        children: [
                          ListTile(
                                title: Image.network(photos.thumbnailUrl),
                                subtitle: Text(
                                  '${photos.id} ${photos.title}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                        ],
                      ),
                    ))
                    .toList(),
                semanticChildCount: photos.length,
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
