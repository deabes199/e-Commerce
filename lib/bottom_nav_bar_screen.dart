import 'package:flutter/material.dart';
import 'package:hero_store_app/core/routing/app_router.dart';
import 'package:hero_store_app/core/theming/app_colors.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavBarScreen> {
  late PageController pageController;
  int currntScreen = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: currntScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: AppRouter.screens,
      ),
      bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          height: 60,
          selectedIndex: currntScreen,
          onDestinationSelected: (value) {
            setState(() {
              currntScreen = value;
            });
            pageController.jumpToPage(currntScreen);
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home_filled,
                size: 30,
                color: AppColors.primaryColor,
              ),
              icon: Icon(
                Icons.home_filled,
                color: Colors.grey,
              ),
              label: 'Home',
            ),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.production_quantity_limits_sharp,
                  color: AppColors.primaryColor,
                ),
                icon: Icon(
                  Icons.production_quantity_limits_rounded,
                  size: 30,
                  color: Colors.grey,
                ),
                label: 'Products'),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.shopping_cart,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
                label: 'Cart'),
            NavigationDestination(
                selectedIcon: Icon(
                  Icons.person,
                  size: 30,
                  color: AppColors.primaryColor,
                ),
                icon: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                label: 'Account'),
          ]),
    );
  }
}
