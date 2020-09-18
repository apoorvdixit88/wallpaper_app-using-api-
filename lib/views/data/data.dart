import 'package:wallpaper/views/model/category_model.dart';
String apiKey="563492ad6f917000010000015022ea4ba5b244c1989191c6141367af";
List<CategoriesModel> getCategories(){
List<CategoriesModel> categories = new List();
CategoriesModel categoriesModel = new CategoriesModel();
//
categoriesModel.imgUrl="https://images.pexels.com/photos/1231692/pexels-photo-1231692.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260";
categoriesModel.categoryName="Bikes";
categories.add(categoriesModel);
categoriesModel = new CategoriesModel();
//
categoriesModel.imgUrl="https://images.pexels.com/photos/820735/pexels-photo-820735.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
categoriesModel.categoryName="SteetArt";
categories.add(categoriesModel);
categoriesModel = new CategoriesModel();
//
categoriesModel.imgUrl="https://images.pexels.com/photos/4143686/pexels-photo-4143686.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
categoriesModel.categoryName="Cars";
categories.add(categoriesModel);
categoriesModel = new CategoriesModel();
//
categoriesModel.imgUrl="https://images.pexels.com/photos/417074/pexels-photo-417074.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
categoriesModel.categoryName="Nature";
categories.add(categoriesModel);
categoriesModel = new CategoriesModel();
//
categoriesModel.imgUrl="https://images.pexels.com/photos/16066/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500";
categoriesModel.categoryName="Wildlife";
categories.add(categoriesModel);
categoriesModel = new CategoriesModel();
//
categoriesModel.imgUrl="https://images.pexels.com/photos/142497/pexels-photo-142497.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
categoriesModel.categoryName="Forest";
categories.add(categoriesModel);
categoriesModel = new CategoriesModel();
return categories;
}