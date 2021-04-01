import 'package:flutter/material.dart';
import 'package:flutter_app_json/Model/albums_model.dart';
import 'package:flutter_app_json/Model/user_model.dart';
import 'HTTP_Service/http_service_albums.dart';
import 'HTTP_Service/http_service_photo.dart';
import 'HTTP_Service/http_service_users.dart';

final HttpServiceUser httpServiceUser = HttpServiceUser();
final HttpServiceAlbum httpServiceAlbum = HttpServiceAlbum();
final HttpServicePhotos httpServicePhotos = HttpServicePhotos();

class UserDetail extends StatelessWidget {
  //ignore
  //final Users users;
  //final Albums albums;
  //const UserDetail({@required this.users, @required this.albums});

  @override
  Widget build(BuildContext context) {
    final Users users = ModalRoute.of(context).settings.arguments;
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
                          onTap: () => Navigator.of(context)
                              .pushNamed("/c", arguments: albums),
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
