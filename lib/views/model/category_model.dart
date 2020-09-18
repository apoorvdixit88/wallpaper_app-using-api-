import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/views/data/data.dart';
import 'package:wallpaper/views/model/wallpaper.dart';
import 'package:wallpaper/widgets/widget.dart';
class CategoriesModel{
String categoryName;
String imgUrl;

}

class Categorie extends StatefulWidget {
  final String categoryName;
  Categorie({this.categoryName});
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {

List<WallpaperModel> wallpapers = new List();

  getSearchWallpaper(String query) async {
    await http.get("https://api.pexels.com/v1/search?query=$query&per_page=20", headers: {
      "Authorization": apiKey,
    }).then((value) {
      //  print(response.body.toString());
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        //  print(element);
        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapers.add(wallpaperModel);
        // print(wallpaperModel.src.portrait);
      });
      setState(() {});
    });
  }
  @override
 void initState() {
    getSearchWallpaper(widget.categoryName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: brandName(),
        elevation: 0,
      ),
      body: SingleChildScrollView(
              child: Container(
          child: Column(
            children: [
                wallpapersList(wallpapers, context)
            ],
          ),
        ),
      ),  
    );
  }
}