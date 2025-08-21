import 'package:flutter/material.dart';
import 'package:insurance/const/app_asset.dart';
import 'package:provider/provider.dart';

import '../viewmodel/dashboard_screen_viewmodel.dart';
import 'Insurance_Screen.dart';
import 'Invest_screen.dart';
import 'consult_screen.dart';

class DashBoardScreen extends StatelessWidget {
  final List<Widget> screens = [Invest(), Insurance(), Consult()];

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => DashBoardScreenViewModel(),
      child: Consumer<DashBoardScreenViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false, // Remove the back button
              title: Row(
                children: [
                  Image.asset(
                    AppAsset.logo,
                    height: screenHeight * 0.1, // Responsive logo height
                    width: screenWidth * 0.4, // Responsive logo width
                  ),
                  SizedBox(width: screenWidth * 0.03), // Responsive spacing
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.help_outline),
                  onPressed: () {
                    print('Help pressed');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () => print('Profile pressed'),
                ),
                SizedBox(width: screenWidth * 0.05), // Responsive spacing
              ],
            ),
            body: SafeArea(
              child: Container(
                color: Colors.white,
                child: screens[viewModel.currentIndex],
              ),
            ),
            bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                backgroundColor: Colors.white,
                indicatorColor: Colors.blue.shade100,
                surfaceTintColor: Colors.transparent,
                labelTextStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.w400,
                  ), // Responsive font size
                ),
              ),
              child: NavigationBar(
                height: screenHeight * 0.08, // Responsive bottom nav height
                labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                selectedIndex: viewModel.currentIndex,
                animationDuration: Duration(milliseconds: 300),
                onDestinationSelected: viewModel.updateIndex,
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    label: 'Invest',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.verified_user_outlined),
                    label: 'Insurance',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.insert_comment_outlined),
                    label: 'Consult',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
