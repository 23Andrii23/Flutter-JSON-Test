import 'package:flutter/material.dart';
import 'package:flutter_app_json/HTTP_Service/http_service_albums.dart';
import 'package:flutter_app_json/Model/user_model.dart';
import 'HTTP_Service/http_service_photo.dart';
import 'HTTP_Service/http_service_users.dart';

final HttpServiceUser httpServiceUser = HttpServiceUser();
final HttpServiceAlbum httpServiceAlbum = HttpServiceAlbum();
final HttpServicePhotos httpServicePhotos = HttpServicePhotos();

class UsersPage extends StatefulWidget {

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder(
          future: httpServiceUser.getUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<Users>> snapshot) {
            if (snapshot.hasData) {
              List<Users> users = snapshot.data;
              return ListView(
                children: users
                    .map((Users users) =>
                    ListTile(
                      leading: Icon(
                        Icons.perm_identity,
                      ),
                      title: Text(
                        users.name,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        users.email,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () =>
                          Navigator.of(context)
                              .pushNamed("/b", arguments: users),
                    ))
                    .toList(),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}