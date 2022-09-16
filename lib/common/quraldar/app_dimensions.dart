import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; // 842
  static double screenWidth = Get.context!.width; // sumsung 360 iphone 390

  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  // dynamic height padding and margin
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  // dynamic width padding and margin
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

  // Font sizes
  static double font12 = screenHeight / 70.2;
  static double font20 = screenHeight / 42.2;

  // Radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 24.13;

  // icon size
  static double iconSzie18 = screenHeight / 47.0; // deflut icon size is 24
  static double iconSzie24 = screenHeight / 35.17;

  // List view images

  static double listViewImgeSize = screenWidth / 3.25;
  static double listViewTextContainerSize = screenWidth / 3.9;
}
