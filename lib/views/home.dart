import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper/views/data/data.dart';
import 'package:wallpaper/views/model/wallpaper.dart';
import 'package:wallpaper/widgets/widget.dart';
import 'package:http/http.dart' as http;
import 'model/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  //
List<CategoriesModel> categories = new List();
int noofloads=30;
List<WallpaperModel> wallpapers= new List();

 void getTrendingWallpaper() async{
     var response = await http.get( "https://api.pexels.com/v1/curated?per_page=1",headers: {
       "Authorization": apiKey,
     });
    //  print(response.body.toString());
     Map<String,dynamic> jsonData= jsonDecode(response.body);
     jsonData["photos"].forEach((element){
       print(element);
    //   WallpaperModel wallpaperModel = new WallpaperModel();
    //   wallpaperModel = WallpaperModel.fromMap(element);
    //   wallpapers.add(wallpaperModel);
     });
    //  setState(() {});
    
   }


  @override
  void initState() {
    getTrendingWallpaper();
    categories=getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                   borderRadius: BorderRadius.circular(30)
                 ),
                 margin: EdgeInsets.symmetric(horizontal: 30),
                 padding: EdgeInsets.symmetric(horizontal: 25),
                 child: Row(
                  children: [
                    Expanded(child: 
                    TextField(
                      
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:"Search Wallpaper",),
                      ),
                    ),
                 Icon(
                   Icons.search
                 )
                  ],
                 ),
               ),
               SizedBox(height: 16,),
               Container(
                 height: 80,
                 child: ListView.builder(
                   padding: EdgeInsets.symmetric(horizontal: 24),
                   shrinkWrap: true,
                   scrollDirection: Axis.horizontal,
                   itemCount: categories.length,
                   itemBuilder: (context,index){
                     return CategoriesTile(
                       title: categories[index].categoryName,
                       
                       imgUrl: categories[index].imgUrl,
                     );
                   }
                   ),
               ),
                SizedBox(height: 16,),
                //
                // wallpapersList(wallpapers ,context )
             ],
           ),
           ),
         ),
         
    );    
  }
}



class CategoriesTile extends StatelessWidget {

  final String imgUrl,title;

  CategoriesTile({this.imgUrl,this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(
  
        children: [
         
           ClipRRect(
            borderRadius: BorderRadius.circular(16), 
             child: Image.network(imgUrl,height: 50,width: 100,fit: BoxFit.cover,)
             ),
         
          Container(
         
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
               color: Colors.black12,
            ),
            alignment: Alignment.center,
            height: 50,width: 100,
            child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
    
        ],
      ),
    );
  }
}


