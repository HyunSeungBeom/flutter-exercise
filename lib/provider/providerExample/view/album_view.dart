import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../model/album.dart";
import '../provider/album_provider.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late List<Album> albumList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Album List"),
        backgroundColor: Colors.green[50],
        elevation: 0,
      ),
      body: Consumer<AlbumProvider>(
        builder: (context, provider, child) {
          albumList = provider.getAlbumList();

          return ListView.builder(
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.green[50],
                padding: const EdgeInsets.all(15),
                child: Text(
                  "${albumList[index].id}: ${albumList[index].title}",
                ),
              );
            },
          );
        },
      ),
    );
  }
}
