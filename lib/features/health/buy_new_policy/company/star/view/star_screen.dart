import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:insurance/features/health/buy_new_policy/company/star/view/star_tabs.dart';
import 'package:insurance/routes/routes_name.dart';
import 'package:provider/provider.dart';
import '../../../../../chatbot/chat_screen.dart';
import '../viewmodel/star_viewmodel.dart';
import 'duration_screen.dart';

class StarScreen extends StatelessWidget {
  const StarScreen({super.key});

  Future<void> showSumInsuredPicker({
    required BuildContext context,
    required String title,
    required List<String> options,
    required int initialIndex,
    required ValueChanged<String> onValueSelected,
  }) async {
    int selectedIndex = initialIndex;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: initialIndex,
                  ),
                  itemExtent: 48,
                  looping: true,
                  onSelectedItemChanged: (index) {
                    selectedIndex = index;
                  },
                  children: options
                      .map(
                        (value) => Center(
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 14),
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StarScreenViewModel(),
      child: Consumer<StarScreenViewModel>(
        builder: (context, viewModel, child) {
          final PageController _pageController = PageController(
            initialPage: viewModel.selectedSegment.value,
          );

          return Scaffold(
            appBar: AppBar(
              title: const Text('Customize your Plan'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Star Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/star_logo.jpg", // Your logo
                                      width: 36,
                                    ),
                                    const SizedBox(width: 21),
                                    const Text(
                                      "Star Comprehensive",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Members",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "Self",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Term",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "1 year",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Sum Insured
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 21,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 6),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          await showSumInsuredPicker(
                            context: context,
                            title: "Sum Insured",
                            options: viewModel.sumOptions,
                            initialIndex: viewModel.sumOptions.indexOf(
                              viewModel.selectedSumInsured,
                            ),
                            onValueSelected: (value) {
                              viewModel.setSelectedSumInsured(value);
                            },
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Sum Insured",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    viewModel.selectedSumInsured,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(Icons.keyboard_arrow_down_rounded),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 11),

                    // Sliding Segmented Control
                    StarFlexibleTabWidget(),
                    SizedBox(height: 21),
                    // Bottom content
                    const Row(
                      children: [
                        Text(
                          "Need Assistance?",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "We are always up to help you protect your wealth.",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Icon(
                                Icons.call_outlined,
                                size: 16,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Set up call",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(),
                              ),
                            );
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                size: 16,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Chat with us",
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: Container(
                height: 81,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Premium (incl. GST)",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "₹12,394", // Updated to match the image
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate
                        Navigator.pushNamed(
                          context,
                          RouteNames.starDurationScreen,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 34,
                          vertical: 14,
                        ),
                      ),
                      child: const Text("Select Plan"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
