import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/term/buy_new_policy/recommentation/recommentation_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../../routes/routes_name.dart';
import '../term_card/view/term_plan_screen.dart';

class TearmRecommendationScreen extends StatelessWidget {
  const TearmRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.4,
      maxChildSize: 0.60, // Adjusting maxChildSize for better flexibility
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ChangeNotifierProvider(
            create: (_) => RecommendationModel(),
            child: RecommendationContent(scrollController: scrollController),
          ),
        );
      },
    );
  }
}

class RecommendationContent extends StatelessWidget {
  final ScrollController scrollController;

  const RecommendationContent({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RecommendationModel>(context);

    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Function to build dropdown fields with media query to scale size
    Widget buildDropdownField({
      required String label,
      required String value,
      required VoidCallback onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.only(
            bottom: screenHeight * 0.01,
          ), // 2% of screen height
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.011, // 1.5% of screen height
            horizontal: screenWidth * 0.05, // 5% of screen width
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize:
                          screenWidth *
                          0.04, // Scales font size based on screen width
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize:
                          screenWidth *
                          0.05, // Scales font size based on screen width
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      );
    }

    Future<void> showPickerBottomSheet({
      required String title,
      required List<String> options,
      required int initialIndex,
      required ValueChanged<String> onValueSelected,
    }) async {
      int selectedIndex = initialIndex;

      await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (_) {
          return Padding(
            padding: EdgeInsets.only(
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              top: screenHeight * 0.02,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: screenWidth * 0.05, // Scales font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      options[selectedIndex],
                      style: TextStyle(
                        fontSize: screenWidth * 0.040, // Scales font size
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height:
                      screenHeight *
                      0.25, // Adjust picker height based on screen size
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                      initialItem: initialIndex,
                    ),
                    itemExtent:
                        screenHeight * 0.06, // Scales picker item height
                    onSelectedItemChanged: (index) => selectedIndex = index,
                    children: options
                        .map((value) => Center(child: Text(value)))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 11),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                      ), // 2% of screen height
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      onValueSelected(options[selectedIndex]);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.02,
      ), // Padding adjusted
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommendations for you",
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Scaled font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 7),
          buildDropdownField(
            label: 'Life Cover',
            value: viewModel.selectedAmount,
            onTap: () => showPickerBottomSheet(
              title: 'Amount',
              options: viewModel.amountOptions,
              initialIndex: viewModel.amountOptions.indexOf(
                viewModel.selectedAmount,
              ),
              onValueSelected: (val) => viewModel.updateAmount(val),
            ),
          ),
          buildDropdownField(
            label: 'Cover till age',
            value: viewModel.selectedAge,
            onTap: () => showPickerBottomSheet(
              title: 'Cover till Age',
              options: viewModel.ageOptions,
              initialIndex: viewModel.ageOptions.indexOf(viewModel.selectedAge),
              onValueSelected: (val) => viewModel.updateAge(val),
            ),
          ),
          buildDropdownField(
            label: 'Pay For',
            value: viewModel.selectedPayFor,
            onTap: () => showPickerBottomSheet(
              title: 'Pay For',
              options: viewModel.payForOptions,
              initialIndex: viewModel.payForOptions.indexOf(
                viewModel.selectedPayFor,
              ),
              onValueSelected: (val) => viewModel.updatePayFor(val),
            ),
          ),
          buildDropdownField(
            label: 'Payment Frequency',
            value: viewModel.selectedFrequency,
            onTap: () => showPickerBottomSheet(
              title: 'Payment Frequency',
              options: viewModel.frequencyOptions,
              initialIndex: viewModel.frequencyOptions.indexOf(
                viewModel.selectedFrequency,
              ),
              onValueSelected: (val) => viewModel.updateFrequency(val),
            ),
          ),
          const SizedBox(height: 7),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.termPlanScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.02,
                ), // Adjust button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Text(
                "View Plans",
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  color: Colors.white,
                ), // Scaled text size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
