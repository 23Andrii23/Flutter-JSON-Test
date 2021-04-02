import 'package:flutter/material.dart';
import 'package:flutter_app_json/Model/albums_model.dart';
import 'package:flutter_app_json/Model/user_model.dart';
import 'HTTP_Service/http_service_albums.dart';
import 'HTTP_Service/http_service_photo.dart';
import 'HTTP_Service/http_service_users.dart';
import 'package:flutter_app_json/Constants/constants.dart';

final HttpServiceUser httpServiceUser = HttpServiceUser();
final HttpServiceAlbum httpServiceAlbum = HttpServiceAlbum();
final HttpServicePhotos httpServicePhotos = HttpServicePhotos();

class UserDetail extends StatelessWidget {
  final Users users;
  UserDetail({this.users});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums"),
      ),
      body: FutureBuilder(
          future: httpServiceAlbum.getUsers(users.id),
          builder:
              (BuildContext context, AsyncSnapshot<List<Albums>> snapshot) {
            if (snapshot.hasData) {
              List<Albums> albums = snapshot.data;
              return ListView(
                children: albums
                    .map((Albums albums) => ListTile(
                  leading: Icon(
                    Icons.photo,
                  ),
                          title: Text(
                            '${albums.id} ${albums.title}',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () => Navigator.of(context).pushNamed(Constant.photo, arguments: albums),
                        ))
                    .toList(),
                semanticChildCount: albums.length,
              );
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
