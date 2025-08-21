import 'package:flutter/material.dart';
import 'package:insurance/features/track_policy/track_policy_viewmodel.dart';
import 'package:provider/provider.dart';

import '../health/buy_new_policy/health/Personalize_bottomsheet.dart';
import '../my_policy/policy_screen/insurance_type_screen.dart';
import '../my_policy/viewmodel/insurance_type_viewmodel.dart';

class TrackPolicyTabBarScreen extends StatelessWidget {
  const TrackPolicyTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_) => TrackPolicyViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: const Text("Track Policy"),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal:
                    screenWidth * 0.05, // 5% of screen width for padding
              ),
              child: Container(
                height:
                    screenWidth * 0.1, // Dynamic height based on screen width
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Consumer<TrackPolicyViewModel>(
                  builder: (context, viewModel, child) {
                    final tabs = ['Health', 'Term'];
                    return Row(
                      children: List.generate(tabs.length, (index) {
                        final isSelected = index == viewModel.selectedIndex;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => viewModel.onTabTapped(index),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.blue.shade200
                                    : Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                  fontSize:
                                      screenWidth * 0.04, // Dynamic font size
                                  color: Colors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 11),
            Expanded(
              child: Consumer<TrackPolicyViewModel>(
                builder: (context, viewModel, child) {
                  return PageView(
                    controller: viewModel.pageController,
                    onPageChanged: viewModel.onPageChanged,
                    children: [
                      EmptyPolicyView(
                        policyType: "Health",
                        onExplore: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return HealthPersonalizeScreen();
                            },
                          );
                        },
                      ),
                      EmptyPolicyView(
                        policyType: "Term",
                        onExplore: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return ChangeNotifierProvider(
                                create: (context) => InsuranceTypeViewModel(),
                                child: InsuranceTypeBottomSheet(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyPolicyView extends StatelessWidget {
  final String policyType;
  final VoidCallback onExplore;

  const EmptyPolicyView({
    super.key,
    required this.policyType,
    required this.onExplore,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/document_search.gif', // path to your GIF
          width: screenWidth * 0.35, // Dynamic width based on screen width
          height: screenWidth * 0.5, // Dynamic height based on screen width
        ),
        Text(
          "No $policyType Insurance Policies to Track",
          style: TextStyle(
            fontSize:
                screenWidth * 0.04, // Dynamic font size based on screen width
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onExplore,
          child: Text(
            "Explore Plans",
            style: TextStyle(
              fontSize: screenWidth * 0.04, // Dynamic text size
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:insurance/features/track_policy/track_policy_viewmodel.dart';
// import 'package:provider/provider.dart';
//
// import '../health/buy_new_policy/health/Personalize_bottomsheet.dart';
// import '../my_policy/policy_screen/insurance_type_screen.dart';
// import '../my_policy/viewmodel/insurance_type_viewmodel.dart';
//
// class TrackPolicyTabBarScreen extends StatelessWidget {
//   const TrackPolicyTabBarScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => TrackPolicyViewModel(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           centerTitle: true,
//           title: const Text("Track Policy"),
//         ),
//         body: Column(
//           children: [
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Container(
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Consumer<TrackPolicyViewModel>(
//                   builder: (context, viewModel, child) {
//                     final tabs = ['Health', 'Term'];
//                     return Row(
//                       children: List.generate(tabs.length, (index) {
//                         final isSelected = index == viewModel.selectedIndex;
//                         return Expanded(
//                           child: GestureDetector(
//                             onTap: () => viewModel.onTabTapped(index),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: isSelected
//                                     ? Colors.blue.shade200
//                                     : Colors.blue.shade50,
//                                 borderRadius: BorderRadius.circular(7),
//                               ),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 tabs[index],
//                                 style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: isSelected
//                                       ? FontWeight.bold
//                                       : FontWeight.normal,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 11),
//             Expanded(
//               child: Consumer<TrackPolicyViewModel>(
//                 builder: (context, viewModel, child) {
//                   return PageView(
//                     controller: viewModel.pageController,
//                     onPageChanged: viewModel.onPageChanged,
//                     children: [
//                       EmptyPolicyView(
//                         policyType: "Health",
//                         onExplore: () {
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             backgroundColor: Colors.transparent,
//                             builder: (BuildContext context) {
//                               return HealthPersonalizeScreen();
//                             },
//                           );
//                         },
//                       ),
//                       EmptyPolicyView(
//                         policyType: "Term",
//                         onExplore: () {
//                           showModalBottomSheet(
//                             context: context,
//                             isScrollControlled: true,
//                             builder: (BuildContext context) {
//                               return ChangeNotifierProvider(
//                                 create: (context) => InsuranceTypeViewModel(),
//                                 child: InsuranceTypeBottomSheet(),
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class EmptyPolicyView extends StatelessWidget {
//   final String policyType;
//   final VoidCallback onExplore;
//
//   const EmptyPolicyView({
//     super.key,
//     required this.policyType,
//     required this.onExplore,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           'assets/images/document_search.gif', // path to your GIF
//           width: 142,
//           height: 221,
//         ),
//         Text(
//           "No $policyType Insurance Policies to Track",
//           style: const TextStyle(fontSize: 16, color: Colors.black54),
//         ),
//         const SizedBox(height: 40),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           onPressed: onExplore,
//           child: const Text("Explore Plans"),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:insurance/features/health/buy_new_policy/health/Personalize_bottomsheet.dart';
// import 'package:provider/provider.dart';
//
// import '../my_policy/policy_screen/insurance_type_screen.dart';
// import '../my_policy/viewmodel/insurance_type_viewmodel.dart';
//
// class TrackPolicyTabBar extends StatefulWidget {
//   const TrackPolicyTabBar({super.key});
//
//   @override
//   State<TrackPolicyTabBar> createState() => _TrackPolicyTabBarState();
// }
//
// class _TrackPolicyTabBarState extends State<TrackPolicyTabBar> {
//   final PageController _pageController = PageController();
//   int selectedIndex = 0;
//
//   void _onTabTapped(int index) {
//     setState(() => selectedIndex = index);
//     _pageController.animateToPage(
//       index,
//       duration: const Duration(milliseconds: 100),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   void _onPageChanged(int index) {
//     setState(() => selectedIndex = index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final tabs = ['Health', 'Term'];
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: true,
//         title: const Text("Track Policy"),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Container(
//               height: 40,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: List.generate(tabs.length, (index) {
//                   final isSelected = index == selectedIndex;
//                   return Expanded(
//                     child: GestureDetector(
//                       onTap: () => _onTabTapped(index),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: isSelected
//                               ? Colors.blue.shade200
//                               : Colors.blue.shade50,
//                           borderRadius: BorderRadius.circular(7),
//                         ),
//                         alignment: Alignment.center,
//                         child: Text(
//                           tabs[index],
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: isSelected
//                                 ? FontWeight.bold
//                                 : FontWeight.normal,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//           // const SizedBox(height: 11),
//           Expanded(
//             child: PageView(
//               controller: _pageController,
//               onPageChanged: _onPageChanged,
//               children: [
//                 EmptyPolicyView(
//                   policyType: "Health",
//                   onExplore: () {
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled:
//                           true, // Allows the bottom sheet to take full height if needed
//                       backgroundColor:
//                           Colors.transparent, // Important for rounded corners
//                       builder: (BuildContext context) {
//                         return HealthPersonalizeScreen();
//                       },
//                     );
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //       builder: (_) => const HealthPlansScreen()),
//                     // );
//                   },
//                 ),
//                 EmptyPolicyView(
//                   policyType: "Term",
//                   onExplore: () {
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled: true,
//                       builder: (BuildContext context) {
//                         return ChangeNotifierProvider(
//                           create: (context) => InsuranceTypeViewModel(),
//                           child: InsuranceTypeBottomSheet(),
//                         );
//                       },
//                     ).then((selectedType) {
//                       // Do something with the selectedType when the bottom sheet is closed
//                       if (selectedType != null) {
//                         print('User selected: $selectedType');
//                       }
//                     });
//                     // Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //       builder: (_) => const TermPlansScreen()),
//                     // );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class EmptyPolicyView extends StatelessWidget {
//   final String policyType;
//   final VoidCallback onExplore;
//
//   const EmptyPolicyView({
//     super.key,
//     required this.policyType,
//     required this.onExplore,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // const Icon(Icons.inbox, size: 80, color: Colors.grey),
//         Image.asset(
//           'assets/images/document_search.gif', // path to your GIF
//           width: 142,
//           height: 221,
//         ),
//         // const SizedBox(height: 20),
//         Text(
//           "No $policyType Insurance Policies to Track",
//           style: const TextStyle(fontSize: 16, color: Colors.black54),
//         ),
//         const SizedBox(height: 40),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.blue,
//             foregroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           onPressed: onExplore,
//           child: const Text("Explore Plans"),
//         ),
//       ],
//     );
//   }
// }
