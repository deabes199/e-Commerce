class AssetsManager {
  static String imagePath = 'assets/images/banners';

  /// banners
  static String banner1 = '$imagePath/1b.jpg';
  static String banner2 = '$imagePath/2b.jpg';
  static String banner3 = '$imagePath/3b.jpg';

  static String defaultprofileImage =
      'https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Clipart.png';
}

class AppLists {
  static List banners = [
    AssetsManager.banner1,
    AssetsManager.banner2,
    AssetsManager.banner3
  ];
}
