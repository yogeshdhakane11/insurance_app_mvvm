import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'policy_card.dart';
import '../viewmodel/insurance_type_viewmodel.dart';
import '../viewmodel/my_policy_viewmodel.dart';
import 'insurance_type_screen.dart';

class MyPolicyScreen extends StatefulWidget {
  @override
  _MyPolicyScreenState createState() => _MyPolicyScreenState();
}

class _MyPolicyScreenState extends State<MyPolicyScreen> {
  late MyPolicyViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = MyPolicyViewModel();
    _viewModel.fetchPolicyCards(context);
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive design
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<MyPolicyViewModel>(
      create: (_) => _viewModel,
      child: Consumer<MyPolicyViewModel>(
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Policy Page",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.05, // Responsive font size
                ),
              ),
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: model.isLoading
                ? Center(child: CircularProgressIndicator())
                : model.cards.isEmpty
                ? Center(child: Text("No cards available"))
                : ListView.builder(
                    padding: EdgeInsets.all(
                      screenWidth * 0.04,
                    ), // Responsive padding
                    itemCount: model.cards.length,
                    itemBuilder: (context, index) {
                      final card = model.cards[index];
                      return MyPolicyCard(
                        title: card['insurance_type'] ?? 'Policy',
                        planName: card['plan_nick_name'] ?? '',
                        validFrom: card['valid_from'] ?? '',
                        validTill: card['valid_till'] ?? '',
                      );
                    },
                  ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.07, // Responsive button height
                child: ElevatedButton.icon(
                  onPressed: () {
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
                  icon: const Icon(Icons.add),
                  label: Text("Add existing policy"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    textStyle: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive text size
                      fontWeight: FontWeight.bold,
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'policy_card.dart';
// import '../viewmodel/insurance_type_viewmodel.dart';
// import '../viewmodel/my_policy_viewmodel.dart';
// import 'insurance_type_screen.dart';
//
// class MyPolicyScreen extends StatefulWidget {
//   @override
//   _MyPolicyScreenState createState() => _MyPolicyScreenState();
// }
//
// class _MyPolicyScreenState extends State<MyPolicyScreen> {
//   late MyPolicyViewModel _viewModel;
//
//   @override
//   void initState() {
//     super.initState();
//     _viewModel = MyPolicyViewModel();
//     _viewModel.fetchPolicyCards(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<MyPolicyViewModel>(
//       create: (_) => _viewModel,
//       child: Consumer<MyPolicyViewModel>(
//         builder: (context, model, _) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               title: const Text(
//                 "Policy Page",
//                 style: TextStyle(color: Colors.black),
//               ),
//               iconTheme: const IconThemeData(color: Colors.black),
//               elevation: 0,
//               leading: IconButton(
//                 icon: const Icon(Icons.arrow_back_ios),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),
//             body: model.isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : model.cards.isEmpty
//                 ? const Center(child: Text("No cards available"))
//                 : ListView.builder(
//                     padding: const EdgeInsets.all(16),
//                     itemCount: model.cards.length,
//                     itemBuilder: (context, index) {
//                       final card = model.cards[index];
//                       return CardWidget(
//                         title: card['insurance_type'] ?? 'Policy',
//                         planName: card['plan_nick_name'] ?? '',
//                         validFrom: card['valid_from'] ?? '',
//                         validTill: card['valid_till'] ?? '',
//                       );
//                     },
//                   ),
//             bottomNavigationBar: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled: true,
//                       builder: (BuildContext context) {
//                         return ChangeNotifierProvider(
//                           create: (context) => InsuranceTypeViewModel(),
//                           child: InsuranceTypeBottomSheet(),
//                         );
//                       },
//                     );
//                   },
//                   icon: const Icon(Icons.add),
//                   label: const Text("Add existing policy"),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     textStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     elevation: 0,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
