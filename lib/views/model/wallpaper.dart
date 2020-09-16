


class WallpaperModel{

String photographer,photographer_url;
int photographer_id;
SrcModel src;
WallpaperModel({this.src,
this.photographer_url,this.photographer_id,this.photographer});

factory WallpaperModel.fromMap(Map<String ,dynamic> jsonData){

  return WallpaperModel(

    src: SrcModel.fromMap(jsonData["src"]),
    photographer_url: jsonData["photographer_url"],
    photographer_id: jsonData["photographer_id"],
    photographer: jsonData["photographer"]

  );
}
}


class SrcModel{

  String original,small, potrait;

  SrcModel({this.original,this.potrait,this.small});
  factory SrcModel.fromMap(Map<String ,dynamic> jsonData){

      return SrcModel(
      
       potrait: jsonData["potrait"],
       original: jsonData["original"],
       small: jsonData["small"] 
      );

}
}