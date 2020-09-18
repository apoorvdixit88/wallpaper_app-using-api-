import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'data/data.dart';
import 'model/wallpaper.dart';
class Search extends StatefulWidget {
  final String searchQuery;
  Search({this.searchQuery});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  


@override
  void initState() {
    getSearchWallpaper(widget.searchQuery);
    super.initState();
    searchController.text=widget.searchQuery;
  }
TextEditingController searchController = new TextEditingController();
 List<WallpaperModel> wallpapers = new List();
//
 void getSearchWallpaper(String query) async {
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

//
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
               Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff5f8fd),
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Wallpaper",
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                         getSearchWallpaper(searchController.text);
                        },
                        child: Container(
                          child: Icon(Icons.search),
                        ),
                      )
                    ],
                  ),
                ), SizedBox(
                  height: 16,
                ),
                 wallpapersList(wallpapers, context)
            ],
          ),
        ),
      ),
    );
  }
}