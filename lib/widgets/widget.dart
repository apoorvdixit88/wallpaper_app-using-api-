import 'package:flutter/material.dart';
import 'package:wallpaper/views/image_view.dart';
import 'package:wallpaper/views/model/wallpaper.dart';

Widget brandName(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Pixa_Wall_",style: TextStyle(color: Colors.black),),
       Text("Hub",style: TextStyle(color: Colors.blue),)
    ],
  );
}

Widget wallpapersList(List<WallpaperModel> wallpapers, BuildContext context){

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
     child: GridView.count(
       shrinkWrap: true,
       physics: ClampingScrollPhysics(),
       crossAxisCount: 2,
       childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper){
        return GridTile(
          
          child: GestureDetector
          (
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: 
             (context)=>ImageView(
               imgPath: wallpaper.src.portrait
             )));
           }, 
                      child: Hero(
              tag: wallpaper.src.portrait,
                        child: Container(
         child: ClipRRect(
               borderRadius: BorderRadius.circular(16),
               child: Image.network(wallpaper.src.portrait,fit: BoxFit.cover,)),
              ),
            ),
          ),
          );
      }).toList() ,

  ));
}