import 'package:todo/core/constant/app_colors.dart';
import 'package:todo/core/constant/app_image.dart';
import 'package:todo/features/todo/data/models/color_status_image.dart';

class StaticData {
  static List<ColorStatusImageModel> colorsStatusImage  =[
   ColorStatusImageModel(colorStatus: AppColors.health, images: AppImages.health) ,
   ColorStatusImageModel(colorStatus: AppColors.location, images: AppImages.location) ,
   ColorStatusImageModel(colorStatus: AppColors.shop, images: AppImages.shop) ,
   ColorStatusImageModel(colorStatus: AppColors.sport, images: AppImages.sport) ,
   ColorStatusImageModel(colorStatus: AppColors.other, images: AppImages.other) ,
  ] ;
}