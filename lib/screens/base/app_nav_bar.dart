import 'package:flutter/material.dart';
import 'package:nashmi_app/screens/base/widgets/nav_bar_item.dart';
import 'package:nashmi_app/screens/favorite/favorite_screen.dart';
import 'package:nashmi_app/screens/home/home_screen.dart';
import 'package:nashmi_app/screens/notifications/notifications_screen.dart';
import 'package:nashmi_app/screens/offers/offers_screen.dart';
import 'package:nashmi_app/screens/profile/profile_screen.dart';
import 'package:nashmi_app/utils/base_extensions.dart';
import 'package:nashmi_app/utils/my_icons.dart';
import 'package:nashmi_app/utils/providers_extension.dart';
import 'package:nashmi_app/widgets/nashmi_scaffold.dart';

import '../../notifications/cloud_messaging_service.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({
    super.key,
  });

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _currentIndex = 0;
  late PageController _pageController;
  final cloudMessagingService = CloudMessagingService();

  final items = [
    MyIcons.home,
    MyIcons.favorite,
    MyIcons.offers,
    MyIcons.notification,
    MyIcons.profile,
  ];

  final itemsSelected = [
    MyIcons.homeSelect,
    MyIcons.favSelect,
    MyIcons.offersSelect,
    MyIcons.notificationSelect,
    MyIcons.profileSelect,
  ];

  final screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const OffersScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  void _onSelect(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(_currentIndex);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    context.locationProvider.getStateAndCities(context);
    context.locationProvider.determinePosition(context);
    cloudMessagingService.requestPermission();
    cloudMessagingService.init(context);
    context.userProvider.updateDeviceToken(context);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool withNotch = MediaQuery.of(context).viewPadding.bottom > 0.0;
    return NashmiScaffold(
      body: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: Container(
          height: withNotch ? 85 : 75,
          width: context.mediaQuery.width,
          decoration: BoxDecoration(
            color: context.colorPalette.white,
            // boxShadow: [
            //   // BoxShadow(
            //   //   color: context.colorPalette.blueC2E,
            //   //   offset: const Offset(0.0, 1.0),
            //   //   blurRadius: 3.0,
            //   // ),
            // ],
          ),
          child: Row(
            children: screens.map((element) {
              final index = screens.indexOf(element);
              return NavBarItem(
                onTap: () {
                  if (index == 1) {
                    context.userProvider.handleGuest(
                      context,
                      action: () {
                        _onSelect(index);
                      },
                    );
                  } else {
                    _onSelect(index);
                  }
                },
                isSelected: _currentIndex == index,
                icon: _currentIndex == index ? itemsSelected[index] : items[index],
              );
            }).toList(),
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: screens,
        ),
      ),
    );
  }
}
