import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/health/buy_new_policy/health/personalize_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../../routes/routes_name.dart'; // Import for date formatting

const List<Map<String, String>> members = [
  {'title': 'Self', 'icon': '👨‍👩‍👧'},
  {'title': 'Spouse', 'icon': '💍'},
  {'title': 'Children', 'icon': '👶'},
  {'title': 'Parents and In laws', 'icon': '👵'},
];

class HealthPersonalizeScreen extends StatelessWidget {
  const HealthPersonalizeScreen({super.key});

  // Pass viewModel directly to the bottom sheet function
  void _openDobBottomSheet(
    BuildContext context,
    String member,
    String? currentDob,
    PersonalizeViewModel viewModel,
  ) {
    DateTime selectedDate = currentDob != null && currentDob.isNotEmpty
        ? DateFormat('dd-MMM-yyyy').parse(currentDob)
        : DateTime(2004, 11, 1); // Default to a reasonable past date

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 350,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          member,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Date of Birth",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 150,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: selectedDate,
                        maximumDate: DateTime.now(), // Prevent future dates
                        onDateTimeChanged: (date) {
                          setSheetState(() => selectedDate = date);
                        },
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final dob = DateFormat(
                            'dd-MMM-yyyy',
                          ).format(selectedDate);
                          viewModel.updateDate(member, dob);
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: const Text("Save"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // Pass viewModel directly to the bottom sheet function
  void _openChildrenBottomSheet(
    BuildContext context,
    PersonalizeViewModel viewModel,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            int sonCount = viewModel.getSonCount();
            int daughterCount = viewModel.getDaughterCount();

            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 500, // Increased height to accommodate DOB fields
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Children",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const Text(
                      "(Dependent children below the age of 30)",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Son"),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: sonCount > 0
                                  ? () {
                                      setSheetState(() {
                                        viewModel.updateSonCount(sonCount - 1);
                                      });
                                    }
                                  : null,
                            ),
                            Text(viewModel.getSonCount().toString()),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: sonCount + daughterCount < 4
                                  ? () {
                                      setSheetState(() {
                                        viewModel.updateSonCount(sonCount + 1);
                                      });
                                    }
                                  : null,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Daughter"),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: daughterCount > 0
                                  ? () {
                                      setSheetState(() {
                                        viewModel.updateDaughterCount(
                                          daughterCount - 1,
                                        );
                                      });
                                    }
                                  : null,
                            ),
                            Text(viewModel.getDaughterCount().toString()),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: sonCount + daughterCount < 4
                                  ? () {
                                      setSheetState(() {
                                        viewModel.updateDaughterCount(
                                          daughterCount + 1,
                                        );
                                      });
                                    }
                                  : null,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          for (int i = 1; i <= viewModel.getSonCount(); i++)
                            _buildChildrenDobInput(
                              context,
                              'Son $i',
                              viewModel,
                            ),
                          for (
                            int i = 1;
                            i <= viewModel.getDaughterCount();
                            i++
                          )
                            _buildChildrenDobInput(
                              context,
                              'Daughter $i',
                              viewModel,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: const Text("Add Member"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildChildrenDobInput(
    BuildContext context,
    String memberName,
    PersonalizeViewModel viewModel,
  ) {
    final currentDob = viewModel.selectedDates[memberName];
    final int? age = viewModel.calculateAge(currentDob);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(memberName),
          const SizedBox(height: 4),
          TextFormField(
            readOnly: true,
            controller: TextEditingController(text: currentDob),
            decoration: InputDecoration(
              hintText: "Date of Birth",
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_outlined),
                onPressed: () => _openDobBottomSheet(
                  context,
                  memberName,
                  currentDob,
                  viewModel,
                ), // Pass viewModel
              ),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
            onTap: () => _openDobBottomSheet(
              context,
              memberName,
              currentDob,
              viewModel,
            ), // Pass viewModel
          ),
          if (age != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Age: $age years",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }

  // Pass viewModel directly to the bottom sheet function
  void _openParentsBottomSheet(
    BuildContext context,
    PersonalizeViewModel viewModel,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: const EdgeInsets.all(16),
                height: 600, // Increased height to accommodate dynamic fields
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Parents and In laws",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildParentCheckboxTile(
                            context,
                            'Mother',
                            viewModel,
                            setSheetState,
                          ),
                          if (viewModel.selectedParents.contains('Mother'))
                            _buildParentDobInput(context, 'Mother', viewModel),
                          _buildParentCheckboxTile(
                            context,
                            'Father',
                            viewModel,
                            setSheetState,
                          ),
                          if (viewModel.selectedParents.contains('Father'))
                            _buildParentDobInput(context, 'Father', viewModel),
                          _buildParentCheckboxTile(
                            context,
                            'Mother-in-law',
                            viewModel,
                            setSheetState,
                          ),
                          if (viewModel.selectedParents.contains(
                            'Mother-in-law',
                          ))
                            _buildParentDobInput(
                              context,
                              'Mother-in-law',
                              viewModel,
                            ),
                          _buildParentCheckboxTile(
                            context,
                            'Father-in-law',
                            viewModel,
                            setSheetState,
                          ),
                          if (viewModel.selectedParents.contains(
                            'Father-in-law',
                          ))
                            _buildParentDobInput(
                              context,
                              'Father-in-law',
                              viewModel,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                        child: const Text("Add Member"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildParentCheckboxTile(
    BuildContext context,
    String memberName,
    PersonalizeViewModel viewModel,
    StateSetter setSheetState,
  ) {
    return CheckboxListTile(
      title: Text(memberName),
      value: viewModel.selectedParents.contains(memberName),
      onChanged: (value) {
        setSheetState(() {
          List<String> updatedParents = List.from(viewModel.selectedParents);
          if (value!) {
            if (!updatedParents.contains(memberName)) {
              updatedParents.add(memberName);
            }
          } else {
            updatedParents.remove(memberName);
            viewModel.removeDate(memberName); // Remove DOB if deselected
          }
          viewModel.updateParents(updatedParents);
        });
      },
    );
  }

  Widget _buildParentDobInput(
    BuildContext context,
    String memberName,
    PersonalizeViewModel viewModel,
  ) {
    final currentDob = viewModel.selectedDates[memberName];
    final int? age = viewModel.calculateAge(currentDob);

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Date of Birth"),
          const SizedBox(height: 4),
          TextFormField(
            readOnly: true,
            controller: TextEditingController(text: currentDob),
            decoration: InputDecoration(
              hintText: "Date of Birth",
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_outlined),
                onPressed: () => _openDobBottomSheet(
                  context,
                  memberName,
                  currentDob,
                  viewModel,
                ), // Pass viewModel
              ),
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
            onTap: () => _openDobBottomSheet(
              context,
              memberName,
              currentDob,
              viewModel,
            ), // Pass viewModel
          ),
          if (age != null)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                "Age: $age years",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
        ],
      ),
    );
  }

  // This _submitData method is no longer needed in the UI as the ViewModel handles it.
  // It was causing redundancy.
  /*
  Future<void> _submitData(
    BuildContext context,
    PersonalizeViewModel viewModel,
  ) async {
    final selectedDates = viewModel.selectedDates;

    if (kDebugMode) {
      print('Selected Dates on Submit: $selectedDates');
    }

    String? reformatDate(String? date) {
      if (date == null || date.isEmpty) return null;
      try {
        final dateTime = DateFormat('dd-MMM-yyyy').parse(date);
        return DateFormat('yyyy-MM-dd').format(dateTime);
      } catch (e) {
        print('Date parsing error for $date: $e');
        return date; // Return original if parsing fails
      }
    }

    final Map<String, dynamic> payload = {
      "self_dob": reformatDate(selectedDates['Self']),
      "spouse_dob": reformatDate(selectedDates['Spouse']),
      "pincode": viewModel.pincodeController.text,
    };

    // Add children's DOBs
    for (int i = 1; i <= viewModel.getSonCount(); i++) {
      payload['son${i}_dob'] = reformatDate(selectedDates['Son $i']);
    }
    for (int i = 1; i <= viewModel.getDaughterCount(); i++) {
      payload['daughter${i}_dob'] = reformatDate(selectedDates['Daughter $i']);
    }

    // Add parents' DOBs
    for (var parent in viewModel.selectedParents) {
      String key = parent.toLowerCase().replaceAll('-', '_') + '_dob';
      payload[key] = reformatDate(selectedDates[parent]);
    }

    payload.removeWhere(
      (key, value) => value == null || (value is String && value.isEmpty),
    );

    if (kDebugMode) {
      print('API Payload: $payload');
      // Simulate API call for demonstration
      await Future.delayed(const Duration(seconds: 1));
      print('Simulated API Success for payload: $payload');
    }

    // Actual API call (uncomment and configure when ready)
    // Removed to prevent confusion, ViewModel handles this.
  }
  */

  Widget _buildMainScreenDobSummary(
    String memberName,
    String? dob,
    PersonalizeViewModel viewModel,
  ) {
    if (dob == null || dob.isEmpty) {
      return const SizedBox.shrink();
    }
    final int? age = viewModel.calculateAge(dob);
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        "DOB: $dob ${age != null ? '(Age: $age)' : ''}",
        style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PersonalizeViewModel(),
      child: Consumer<PersonalizeViewModel>(
        builder: (context, viewModel, child) {
          return DraggableScrollableSheet(
            initialChildSize: 0.70,
            maxChildSize: 0.70, // Increased max size
            minChildSize: 0.6,
            expand: false, // Ensure it doesn't expand to full screen by default
            builder: (_, controller) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Personalize",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView(
                        controller: controller,
                        children: [
                          const Text(
                            "Hi Yogesh, who are you insuring?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "You can select multiple members (upto 6)",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          const SizedBox(height: 12),
                          ...members.map((item) {
                            final title = item['title']!;
                            final icon = item['icon']!;

                            // Determine if the main tile should be marked as "selected"
                            bool isSelected = false;
                            if (title == 'Self') {
                              isSelected = viewModel.selectedDates.containsKey(
                                'Self',
                              );
                            } else if (title == 'Spouse') {
                              isSelected = viewModel.selectedDates.containsKey(
                                'Spouse',
                              );
                            } else if (title == 'Children') {
                              isSelected =
                                  viewModel.getSonCount() > 0 ||
                                  viewModel.getDaughterCount() > 0;
                            } else if (title == 'Parents and In laws') {
                              isSelected = viewModel.selectedParents.isNotEmpty;
                            }

                            return GestureDetector(
                              onTap: () {
                                if (title == 'Children') {
                                  _openChildrenBottomSheet(
                                    context,
                                    viewModel,
                                  ); // Pass viewModel
                                } else if (title == 'Parents and In laws') {
                                  _openParentsBottomSheet(
                                    context,
                                    viewModel,
                                  ); // Pass viewModel
                                } else {
                                  _openDobBottomSheet(
                                    context,
                                    title,
                                    viewModel.selectedDates[title],
                                    viewModel,
                                  ); // Pass viewModel
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.green
                                        : Colors.grey.shade300,
                                    width: isSelected ? 2 : 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          icon,
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            title,
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          isSelected
                                              ? Icons.check_circle
                                              : Icons.radio_button_off,
                                          color: isSelected
                                              ? Colors.green
                                              : Colors.grey,
                                        ),
                                      ],
                                    ),
                                    if (title == 'Self' &&
                                        viewModel.selectedDates.containsKey(
                                          'Self',
                                        ))
                                      _buildMainScreenDobSummary(
                                        'Self',
                                        viewModel.selectedDates['Self'],
                                        viewModel,
                                      ),
                                    if (title == 'Spouse' &&
                                        viewModel.selectedDates.containsKey(
                                          'Spouse',
                                        ))
                                      _buildMainScreenDobSummary(
                                        'Spouse',
                                        viewModel.selectedDates['Spouse'],
                                        viewModel,
                                      ),
                                    if (title == 'Children' &&
                                        (viewModel.getSonCount() > 0 ||
                                            viewModel.getDaughterCount() > 0))
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 6,
                                          left: 32,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (
                                              int i = 1;
                                              i <= viewModel.getSonCount();
                                              i++
                                            )
                                              _buildMainScreenDobSummary(
                                                'Son $i',
                                                viewModel
                                                    .selectedDates['Son $i'],
                                                viewModel,
                                              ),
                                            for (
                                              int i = 1;
                                              i <= viewModel.getDaughterCount();
                                              i++
                                            )
                                              _buildMainScreenDobSummary(
                                                'Daughter $i',
                                                viewModel
                                                    .selectedDates['Daughter $i'],
                                                viewModel,
                                              ),
                                          ],
                                        ),
                                      ),
                                    if (title == 'Parents and In laws' &&
                                        viewModel.selectedParents.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 6,
                                          left: 32,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            for (var parent
                                                in viewModel.selectedParents)
                                              _buildMainScreenDobSummary(
                                                parent,
                                                viewModel.selectedDates[parent],
                                                viewModel,
                                              ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          const SizedBox(height: 11),
                          TextField(
                            controller: viewModel.pincodeController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "Pincode",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 11),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              // Updated onPressed to only call the ViewModel method
                              onPressed: viewModel.isLoading
                                  ? null // Disable button when loading
                                  : () async {
                                      // No need to build the 'body' map here anymore.
                                      // The ViewModel will gather its internal state.
                                      try {
                                        // Navigate
                                        Navigator.pushNamed(
                                          context,
                                          RouteNames.healthChoosePlanScreen,
                                        );
                                        await viewModel
                                            .submitHealthPersonalizeData(
                                              context,
                                            );
                                      } catch (e) {
                                        debugPrint(
                                          "❌ Exception in UI calling ViewModel: ${e.toString()}",
                                        );
                                        // The ViewModel should ideally handle showing a FlushBar for exceptions,
                                        // but this catch is here for any unexpected errors that might bubble up.
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 11,
                                ),
                              ),
                              child: viewModel.isLoading
                                  ? const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      "Continue",
                                      style: TextStyle(fontSize: 16),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// gemini 2
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:insurance/features/health/buy_new_policy/health/personalize_viewmodel.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart'; // Import for date formatting
//
// const List<Map<String, String>> members = [
//   {'title': 'Self', 'icon': '👨‍👩‍👧'},
//   {'title': 'Spouse', 'icon': '💍'},
//   {'title': 'Children', 'icon': '👶'},
//   {'title': 'Parents and In laws', 'icon': '👵'},
// ];
//
// class PersonalizeScreen extends StatelessWidget {
//   const PersonalizeScreen({super.key});
//
//   // Pass viewModel directly to the bottom sheet function
//   void _openDobBottomSheet(
//     BuildContext context,
//     String member,
//     String? currentDob,
//     PersonalizeViewModel viewModel,
//   ) {
//     DateTime selectedDate = currentDob != null && currentDob.isNotEmpty
//         ? DateFormat('dd-MMM-yyyy').parse(currentDob)
//         : DateTime(2004, 11, 1); // Default to a reasonable past date
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 350,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           member,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Date of Birth",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 150,
//                       child: CupertinoDatePicker(
//                         mode: CupertinoDatePickerMode.date,
//                         initialDateTime: selectedDate,
//                         maximumDate: DateTime.now(), // Prevent future dates
//                         onDateTimeChanged: (date) {
//                           setSheetState(() => selectedDate = date);
//                         },
//                       ),
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           final dob = DateFormat(
//                             'dd-MMM-yyyy',
//                           ).format(selectedDate);
//                           viewModel.updateDate(member, dob);
//                           Navigator.pop(context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                         child: const Text("Save"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   // Pass viewModel directly to the bottom sheet function
//   void _openChildrenBottomSheet(
//     BuildContext context,
//     PersonalizeViewModel viewModel,
//   ) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             int sonCount = viewModel.getSonCount();
//             int daughterCount = viewModel.getDaughterCount();
//
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 500, // Increased height to accommodate DOB fields
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Children",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const Text(
//                       "(Dependent children below the age of 30)",
//                       style: TextStyle(fontSize: 13, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text("Son"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: sonCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         viewModel.updateSonCount(sonCount - 1);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(viewModel.getSonCount().toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         viewModel.updateSonCount(sonCount + 1);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text("Daughter"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: daughterCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         viewModel.updateDaughterCount(
//                                           daughterCount - 1,
//                                         );
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(viewModel.getDaughterCount().toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         viewModel.updateDaughterCount(
//                                           daughterCount + 1,
//                                         );
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: ListView(
//                         children: [
//                           for (int i = 1; i <= viewModel.getSonCount(); i++)
//                             _buildChildrenDobInput(
//                               context,
//                               'Son $i',
//                               viewModel,
//                             ),
//                           for (
//                             int i = 1;
//                             i <= viewModel.getDaughterCount();
//                             i++
//                           )
//                             _buildChildrenDobInput(
//                               context,
//                               'Daughter $i',
//                               viewModel,
//                             ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                         child: const Text("Add Member"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildChildrenDobInput(
//     BuildContext context,
//     String memberName,
//     PersonalizeViewModel viewModel,
//   ) {
//     final currentDob = viewModel.selectedDates[memberName];
//     final int? age = viewModel.calculateAge(currentDob);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(memberName),
//           const SizedBox(height: 4),
//           TextFormField(
//             readOnly: true,
//             controller: TextEditingController(text: currentDob),
//             decoration: InputDecoration(
//               hintText: "Date of Birth",
//               suffixIcon: IconButton(
//                 icon: const Icon(Icons.calendar_today_outlined),
//                 onPressed: () => _openDobBottomSheet(
//                   context,
//                   memberName,
//                   currentDob,
//                   viewModel,
//                 ), // Pass viewModel
//               ),
//               border: const OutlineInputBorder(),
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 12,
//                 vertical: 8,
//               ),
//             ),
//             onTap: () => _openDobBottomSheet(
//               context,
//               memberName,
//               currentDob,
//               viewModel,
//             ), // Pass viewModel
//           ),
//           if (age != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 4.0),
//               child: Text(
//                 "Age: $age years",
//                 style: const TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   // Pass viewModel directly to the bottom sheet function
//   void _openParentsBottomSheet(
//     BuildContext context,
//     PersonalizeViewModel viewModel,
//   ) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 600, // Increased height to accommodate dynamic fields
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Parents and In laws",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: ListView(
//                         children: [
//                           _buildParentCheckboxTile(
//                             context,
//                             'Mother',
//                             viewModel,
//                             setSheetState,
//                           ),
//                           if (viewModel.selectedParents.contains('Mother'))
//                             _buildParentDobInput(context, 'Mother', viewModel),
//                           _buildParentCheckboxTile(
//                             context,
//                             'Father',
//                             viewModel,
//                             setSheetState,
//                           ),
//                           if (viewModel.selectedParents.contains('Father'))
//                             _buildParentDobInput(context, 'Father', viewModel),
//                           _buildParentCheckboxTile(
//                             context,
//                             'Mother-in-law',
//                             viewModel,
//                             setSheetState,
//                           ),
//                           if (viewModel.selectedParents.contains(
//                             'Mother-in-law',
//                           ))
//                             _buildParentDobInput(
//                               context,
//                               'Mother-in-law',
//                               viewModel,
//                             ),
//                           _buildParentCheckboxTile(
//                             context,
//                             'Father-in-law',
//                             viewModel,
//                             setSheetState,
//                           ),
//                           if (viewModel.selectedParents.contains(
//                             'Father-in-law',
//                           ))
//                             _buildParentDobInput(
//                               context,
//                               'Father-in-law',
//                               viewModel,
//                             ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                         child: const Text("Add Member"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildParentCheckboxTile(
//     BuildContext context,
//     String memberName,
//     PersonalizeViewModel viewModel,
//     StateSetter setSheetState,
//   ) {
//     return CheckboxListTile(
//       title: Text(memberName),
//       value: viewModel.selectedParents.contains(memberName),
//       onChanged: (value) {
//         setSheetState(() {
//           List<String> updatedParents = List.from(viewModel.selectedParents);
//           if (value!) {
//             if (!updatedParents.contains(memberName)) {
//               updatedParents.add(memberName);
//             }
//           } else {
//             updatedParents.remove(memberName);
//             viewModel.removeDate(memberName); // Remove DOB if deselected
//           }
//           viewModel.updateParents(updatedParents);
//         });
//       },
//     );
//   }
//
//   Widget _buildParentDobInput(
//     BuildContext context,
//     String memberName,
//     PersonalizeViewModel viewModel,
//   ) {
//     final currentDob = viewModel.selectedDates[memberName];
//     final int? age = viewModel.calculateAge(currentDob);
//
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Date of Birth"),
//           const SizedBox(height: 4),
//           TextFormField(
//             readOnly: true,
//             controller: TextEditingController(text: currentDob),
//             decoration: InputDecoration(
//               hintText: "Date of Birth",
//               suffixIcon: IconButton(
//                 icon: const Icon(Icons.calendar_today_outlined),
//                 onPressed: () => _openDobBottomSheet(
//                   context,
//                   memberName,
//                   currentDob,
//                   viewModel,
//                 ), // Pass viewModel
//               ),
//               border: const OutlineInputBorder(),
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 12,
//                 vertical: 8,
//               ),
//             ),
//             onTap: () => _openDobBottomSheet(
//               context,
//               memberName,
//               currentDob,
//               viewModel,
//             ), // Pass viewModel
//           ),
//           if (age != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 4.0),
//               child: Text(
//                 "Age: $age years",
//                 style: const TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _submitData(
//     BuildContext context,
//     PersonalizeViewModel viewModel,
//   ) async {
//     final selectedDates = viewModel.selectedDates;
//
//     if (kDebugMode) {
//       print('Selected Dates on Submit: $selectedDates');
//     }
//
//     String? reformatDate(String? date) {
//       if (date == null || date.isEmpty) return null;
//       try {
//         final dateTime = DateFormat('dd-MMM-yyyy').parse(date);
//         return DateFormat('yyyy-MM-dd').format(dateTime);
//       } catch (e) {
//         print('Date parsing error for $date: $e');
//         return date; // Return original if parsing fails
//       }
//     }
//
//     final Map<String, dynamic> payload = {
//       "self_dob": reformatDate(selectedDates['Self']),
//       "spouse_dob": reformatDate(selectedDates['Spouse']),
//       "pincode": viewModel.pincodeController.text,
//     };
//
//     // Add children's DOBs
//     for (int i = 1; i <= viewModel.getSonCount(); i++) {
//       payload['son${i}_dob'] = reformatDate(selectedDates['Son $i']);
//     }
//     for (int i = 1; i <= viewModel.getDaughterCount(); i++) {
//       payload['daughter${i}_dob'] = reformatDate(selectedDates['Daughter $i']);
//     }
//
//     // Add parents' DOBs
//     for (var parent in viewModel.selectedParents) {
//       String key = parent.toLowerCase().replaceAll('-', '_') + '_dob';
//       payload[key] = reformatDate(selectedDates[parent]);
//     }
//
//     payload.removeWhere(
//       (key, value) => value == null || (value is String && value.isEmpty),
//     );
//
//     if (kDebugMode) {
//       print('API Payload: $payload');
//       // Simulate API call for demonstration
//       await Future.delayed(const Duration(seconds: 1));
//       print('Simulated API Success for payload: $payload');
//     }
//
//     // Actual API call (uncomment and configure when ready)
//     /*
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.1.14:8000/api/family-members/'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(payload),
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print('API Success: ${response.body}');
//       } else {
//         print('API Error: ${response.statusCode} - ${response.body}');
//       }
//     } catch (e) {
//       print('API Exception: $e');
//     }
//     */
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => PersonalizeViewModel(),
//       child: Consumer<PersonalizeViewModel>(
//         builder: (context, viewModel, child) {
//           return DraggableScrollableSheet(
//             initialChildSize: 0.75,
//             maxChildSize: 0.9, // Increased max size
//             minChildSize: 0.6,
//             expand: false, // Ensure it doesn't expand to full screen by default
//             builder: (_, controller) {
//               return Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 10,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Personalize",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: const Icon(Icons.close),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: ListView(
//                         controller: controller,
//                         children: [
//                           const Text(
//                             "Hi Yogesh, who are you insuring?",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           const Text(
//                             "You can select multiple members (upto 6)",
//                             style: TextStyle(fontSize: 13, color: Colors.grey),
//                           ),
//                           const SizedBox(height: 12),
//                           ...members.map((item) {
//                             final title = item['title']!;
//                             final icon = item['icon']!;
//
//                             // Determine if the main tile should be marked as "selected"
//                             bool isSelected = false;
//                             if (title == 'Self') {
//                               isSelected = viewModel.selectedDates.containsKey(
//                                 'Self',
//                               );
//                             } else if (title == 'Spouse') {
//                               isSelected = viewModel.selectedDates.containsKey(
//                                 'Spouse',
//                               );
//                             } else if (title == 'Children') {
//                               isSelected =
//                                   viewModel.getSonCount() > 0 ||
//                                   viewModel.getDaughterCount() > 0;
//                             } else if (title == 'Parents and In laws') {
//                               isSelected = viewModel.selectedParents.isNotEmpty;
//                             }
//
//                             return GestureDetector(
//                               onTap: () {
//                                 if (title == 'Children') {
//                                   _openChildrenBottomSheet(
//                                     context,
//                                     viewModel,
//                                   ); // Pass viewModel
//                                 } else if (title == 'Parents and In laws') {
//                                   _openParentsBottomSheet(
//                                     context,
//                                     viewModel,
//                                   ); // Pass viewModel
//                                 } else {
//                                   _openDobBottomSheet(
//                                     context,
//                                     title,
//                                     viewModel.selectedDates[title],
//                                     viewModel,
//                                   ); // Pass viewModel
//                                 }
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(vertical: 6),
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: isSelected
//                                         ? Colors.green
//                                         : Colors.grey.shade300,
//                                     width: isSelected ? 2 : 1,
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           icon,
//                                           style: const TextStyle(fontSize: 20),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Expanded(
//                                           child: Text(
//                                             title,
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ),
//                                         Icon(
//                                           isSelected
//                                               ? Icons.check_circle
//                                               : Icons.radio_button_off,
//                                           color: isSelected
//                                               ? Colors.green
//                                               : Colors.grey,
//                                         ),
//                                       ],
//                                     ),
//                                     if (title == 'Self' &&
//                                         viewModel.selectedDates.containsKey(
//                                           'Self',
//                                         ))
//                                       _buildMainScreenDobSummary(
//                                         'Self',
//                                         viewModel.selectedDates['Self'],
//                                         viewModel,
//                                       ),
//                                     if (title == 'Spouse' &&
//                                         viewModel.selectedDates.containsKey(
//                                           'Spouse',
//                                         ))
//                                       _buildMainScreenDobSummary(
//                                         'Spouse',
//                                         viewModel.selectedDates['Spouse'],
//                                         viewModel,
//                                       ),
//                                     if (title == 'Children' &&
//                                         (viewModel.getSonCount() > 0 ||
//                                             viewModel.getDaughterCount() > 0))
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             for (
//                                               int i = 1;
//                                               i <= viewModel.getSonCount();
//                                               i++
//                                             )
//                                               _buildMainScreenDobSummary(
//                                                 'Son $i',
//                                                 viewModel
//                                                     .selectedDates['Son $i'],
//                                                 viewModel,
//                                               ),
//                                             for (
//                                               int i = 1;
//                                               i <= viewModel.getDaughterCount();
//                                               i++
//                                             )
//                                               _buildMainScreenDobSummary(
//                                                 'Daughter $i',
//                                                 viewModel
//                                                     .selectedDates['Daughter $i'],
//                                                 viewModel,
//                                               ),
//                                           ],
//                                         ),
//                                       ),
//                                     if (title == 'Parents and In laws' &&
//                                         viewModel.selectedParents.isNotEmpty)
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             for (var parent
//                                                 in viewModel.selectedParents)
//                                               _buildMainScreenDobSummary(
//                                                 parent,
//                                                 viewModel.selectedDates[parent],
//                                                 viewModel,
//                                               ),
//                                           ],
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                           const SizedBox(height: 20),
//                           const Text(
//                             "Where do you reside?",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           TextFormField(
//                             controller: viewModel.pincodeController,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintText: "Pincode",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 12,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () =>
//                             _submitData(context, viewModel), // Pass viewModel
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                         child: const Text("Continue"),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildMainScreenDobSummary(
//     String memberName,
//     String? dob,
//     PersonalizeViewModel viewModel,
//   ) {
//     if (dob == null || dob.isEmpty) {
//       return Container(); // Don't show anything if DOB is not set
//     }
//     final int? age = viewModel.calculateAge(dob);
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2.0),
//       child: Row(
//         children: [
//           Text(
//             "$memberName:",
//             style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(width: 8),
//           Text(
//             dob,
//             style: const TextStyle(fontSize: 13, color: Colors.black87),
//           ),
//           if (age != null)
//             Text(
//               " (Age: $age years)",
//               style: const TextStyle(fontSize: 13, color: Colors.grey),
//             ),
//         ],
//       ),
//     );
//   }
// }

// gemini 1
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:insurance/features/health/buy_new_policy/health/personalize_viewmodel.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart'; // Import for date formatting
//
// const List<Map<String, String>> members = [
//   {'title': 'Self', 'icon': '👨‍👩‍👧'},
//   {'title': 'Spouse', 'icon': '💍'},
//   {'title': 'Children', 'icon': '👶'},
//   {'title': 'Parents and In laws', 'icon': '👵'},
// ];
//
// class PersonalizeScreen extends StatelessWidget {
//   const PersonalizeScreen({super.key});
//
//   void _openDobBottomSheet(
//     BuildContext context,
//     String member,
//     String? currentDob,
//   ) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     DateTime selectedDate = currentDob != null && currentDob.isNotEmpty
//         ? DateFormat('dd-MMM-yyyy').parse(currentDob)
//         : DateTime(2004, 11, 1); // Default to a reasonable past date
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 350,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           member,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Date of Birth",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 150,
//                       child: CupertinoDatePicker(
//                         mode: CupertinoDatePickerMode.date,
//                         initialDateTime: selectedDate,
//                         maximumDate: DateTime.now(), // Prevent future dates
//                         onDateTimeChanged: (date) {
//                           setSheetState(() => selectedDate = date);
//                         },
//                       ),
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           final dob = DateFormat(
//                             'dd-MMM-yyyy',
//                           ).format(selectedDate);
//                           viewModel.updateDate(member, dob);
//                           Navigator.pop(context);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                         child: const Text("Save"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   void _openChildrenBottomSheet(BuildContext context) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             int sonCount = viewModel.getSonCount();
//             int daughterCount = viewModel.getDaughterCount();
//
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 500, // Increased height to accommodate DOB fields
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Children",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const Text(
//                       "(Dependent children below the age of 30)",
//                       style: TextStyle(fontSize: 13, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text("Son"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: sonCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         viewModel.updateSonCount(sonCount - 1);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(viewModel.getSonCount().toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         viewModel.updateSonCount(sonCount + 1);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text("Daughter"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: daughterCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         viewModel.updateDaughterCount(
//                                           daughterCount - 1,
//                                         );
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(viewModel.getDaughterCount().toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         viewModel.updateDaughterCount(
//                                           daughterCount + 1,
//                                         );
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: ListView(
//                         children: [
//                           for (int i = 1; i <= viewModel.getSonCount(); i++)
//                             _buildChildrenDobInput(
//                               context,
//                               'Son $i',
//                               viewModel,
//                             ),
//                           for (
//                             int i = 1;
//                             i <= viewModel.getDaughterCount();
//                             i++
//                           )
//                             _buildChildrenDobInput(
//                               context,
//                               'Daughter $i',
//                               viewModel,
//                             ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                         child: const Text("Add Member"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildChildrenDobInput(
//     BuildContext context,
//     String memberName,
//     PersonalizeViewModel viewModel,
//   ) {
//     final currentDob = viewModel.selectedDates[memberName];
//     final int? age = viewModel.calculateAge(currentDob);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(memberName),
//           const SizedBox(height: 4),
//           TextFormField(
//             readOnly: true,
//             controller: TextEditingController(text: currentDob),
//             decoration: InputDecoration(
//               hintText: "Date of Birth",
//               suffixIcon: IconButton(
//                 icon: const Icon(Icons.calendar_today_outlined),
//                 onPressed: () =>
//                     _openDobBottomSheet(context, memberName, currentDob),
//               ),
//               border: const OutlineInputBorder(),
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 12,
//                 vertical: 8,
//               ),
//             ),
//             onTap: () => _openDobBottomSheet(context, memberName, currentDob),
//           ),
//           if (age != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 4.0),
//               child: Text(
//                 "Age: $age years",
//                 style: const TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   void _openParentsBottomSheet(BuildContext context) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 600, // Increased height to accommodate dynamic fields
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Parents and In laws",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: ListView(
//                         children: [
//                           _buildParentCheckboxTile(
//                             context,
//                             'Mother',
//                             viewModel,
//                             setSheetState,
//                           ),
//                           if (viewModel.selectedParents.contains('Mother'))
//                             _buildParentDobInput(context, 'Mother', viewModel),
//                           _buildParentCheckboxTile(
//                             context,
//                             'Father',
//                             viewModel,
//                             setSheetState,
//                           ),
//                           if (viewModel.selectedParents.contains('Father'))
//                             _buildParentDobInput(context, 'Father', viewModel),
//                           _buildParentCheckboxTile(
//                             context,
//                             'Mother-in-law',
//                             viewModel,
//                             setSheetState,
//                           ),
//                           if (viewModel.selectedParents.contains(
//                             'Mother-in-law',
//                           ))
//                             _buildParentDobInput(
//                               context,
//                               'Mother-in-law',
//                               viewModel,
//                             ),
//                           _buildParentCheckboxTile(
//                             context,
//                             'Father-in-law',
//                             viewModel,
//                             setSheetState,
//                           ),
//                           if (viewModel.selectedParents.contains(
//                             'Father-in-law',
//                           ))
//                             _buildParentDobInput(
//                               context,
//                               'Father-in-law',
//                               viewModel,
//                             ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                         child: const Text("Add Member"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildParentCheckboxTile(
//     BuildContext context,
//     String memberName,
//     PersonalizeViewModel viewModel,
//     StateSetter setSheetState,
//   ) {
//     return CheckboxListTile(
//       title: Text(memberName),
//       value: viewModel.selectedParents.contains(memberName),
//       onChanged: (value) {
//         setSheetState(() {
//           List<String> updatedParents = List.from(viewModel.selectedParents);
//           if (value!) {
//             if (!updatedParents.contains(memberName)) {
//               updatedParents.add(memberName);
//             }
//           } else {
//             updatedParents.remove(memberName);
//             viewModel.removeDate(memberName); // Remove DOB if deselected
//           }
//           viewModel.updateParents(updatedParents);
//         });
//       },
//     );
//   }
//
//   Widget _buildParentDobInput(
//     BuildContext context,
//     String memberName,
//     PersonalizeViewModel viewModel,
//   ) {
//     final currentDob = viewModel.selectedDates[memberName];
//     final int? age = viewModel.calculateAge(currentDob);
//
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Date of Birth"),
//           const SizedBox(height: 4),
//           TextFormField(
//             readOnly: true,
//             controller: TextEditingController(text: currentDob),
//             decoration: InputDecoration(
//               hintText: "Date of Birth",
//               suffixIcon: IconButton(
//                 icon: const Icon(Icons.calendar_today_outlined),
//                 onPressed: () =>
//                     _openDobBottomSheet(context, memberName, currentDob),
//               ),
//               border: const OutlineInputBorder(),
//               contentPadding: const EdgeInsets.symmetric(
//                 horizontal: 12,
//                 vertical: 8,
//               ),
//             ),
//             onTap: () => _openDobBottomSheet(context, memberName, currentDob),
//           ),
//           if (age != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 4.0),
//               child: Text(
//                 "Age: $age years",
//                 style: const TextStyle(fontSize: 12, color: Colors.grey),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _submitData(BuildContext context) async {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     final selectedDates = viewModel.selectedDates;
//
//     if (kDebugMode) {
//       print('Selected Dates on Submit: $selectedDates');
//     }
//
//     String? reformatDate(String? date) {
//       if (date == null || date.isEmpty) return null;
//       try {
//         final dateTime = DateFormat('dd-MMM-yyyy').parse(date);
//         return DateFormat('yyyy-MM-dd').format(dateTime);
//       } catch (e) {
//         print('Date parsing error for $date: $e');
//         return date; // Return original if parsing fails
//       }
//     }
//
//     final Map<String, dynamic> payload = {
//       "self_dob": reformatDate(selectedDates['Self']),
//       "spouse_dob": reformatDate(selectedDates['Spouse']),
//       "pincode": viewModel.pincodeController.text,
//     };
//
//     // Add children's DOBs
//     for (int i = 1; i <= viewModel.getSonCount(); i++) {
//       payload['son${i}_dob'] = reformatDate(selectedDates['Son $i']);
//     }
//     for (int i = 1; i <= viewModel.getDaughterCount(); i++) {
//       payload['daughter${i}_dob'] = reformatDate(selectedDates['Daughter $i']);
//     }
//
//     // Add parents' DOBs
//     for (var parent in viewModel.selectedParents) {
//       String key = parent.toLowerCase().replaceAll('-', '_') + '_dob';
//       payload[key] = reformatDate(selectedDates[parent]);
//     }
//
//     payload.removeWhere(
//       (key, value) => value == null || (value is String && value.isEmpty),
//     );
//
//     if (kDebugMode) {
//       print('API Payload: $payload');
//       // Simulate API call for demonstration
//       await Future.delayed(const Duration(seconds: 1));
//       print('Simulated API Success for payload: $payload');
//     }
//
//     // Actual API call (uncomment and configure when ready)
//     /*
//     try {
//       final response = await http.post(
//         Uri.parse('http://192.168.1.14:8000/api/family-members/'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(payload),
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         print('API Success: ${response.body}');
//       } else {
//         print('API Error: ${response.statusCode} - ${response.body}');
//       }
//     } catch (e) {
//       print('API Exception: $e');
//     }
//     */
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => PersonalizeViewModel(),
//       child: Consumer<PersonalizeViewModel>(
//         builder: (context, viewModel, child) {
//           return DraggableScrollableSheet(
//             initialChildSize: 0.75,
//             maxChildSize: 0.9, // Increased max size
//             minChildSize: 0.6,
//             expand: false, // Ensure it doesn't expand to full screen by default
//             builder: (_, controller) {
//               return Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 10,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Personalize",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: const Icon(Icons.close),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: ListView(
//                         controller: controller,
//                         children: [
//                           const Text(
//                             "Hi Yogesh, who are you insuring?",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           const Text(
//                             "You can select multiple members (upto 6)",
//                             style: TextStyle(fontSize: 13, color: Colors.grey),
//                           ),
//                           const SizedBox(height: 12),
//                           ...members.map((item) {
//                             final title = item['title']!;
//                             final icon = item['icon']!;
//
//                             // Determine if the main tile should be marked as "selected"
//                             bool isSelected = false;
//                             if (title == 'Self') {
//                               isSelected = viewModel.selectedDates.containsKey(
//                                 'Self',
//                               );
//                             } else if (title == 'Spouse') {
//                               isSelected = viewModel.selectedDates.containsKey(
//                                 'Spouse',
//                               );
//                             } else if (title == 'Children') {
//                               isSelected =
//                                   viewModel.getSonCount() > 0 ||
//                                   viewModel.getDaughterCount() > 0;
//                             } else if (title == 'Parents and In laws') {
//                               isSelected = viewModel.selectedParents.isNotEmpty;
//                             }
//
//                             return GestureDetector(
//                               onTap: () {
//                                 if (title == 'Children') {
//                                   _openChildrenBottomSheet(context);
//                                 } else if (title == 'Parents and In laws') {
//                                   _openParentsBottomSheet(context);
//                                 } else {
//                                   _openDobBottomSheet(
//                                     context,
//                                     title,
//                                     viewModel.selectedDates[title],
//                                   );
//                                 }
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(vertical: 6),
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: isSelected
//                                         ? Colors.green
//                                         : Colors.grey.shade300,
//                                     width: isSelected ? 2 : 1,
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           icon,
//                                           style: const TextStyle(fontSize: 20),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Expanded(
//                                           child: Text(
//                                             title,
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ),
//                                         Icon(
//                                           isSelected
//                                               ? Icons.check_circle
//                                               : Icons.radio_button_off,
//                                           color: isSelected
//                                               ? Colors.green
//                                               : Colors.grey,
//                                         ),
//                                       ],
//                                     ),
//                                     if (title == 'Self' &&
//                                         viewModel.selectedDates.containsKey(
//                                           'Self',
//                                         ))
//                                       _buildMainScreenDobSummary(
//                                         'Self',
//                                         viewModel.selectedDates['Self'],
//                                         viewModel,
//                                       ),
//                                     if (title == 'Spouse' &&
//                                         viewModel.selectedDates.containsKey(
//                                           'Spouse',
//                                         ))
//                                       _buildMainScreenDobSummary(
//                                         'Spouse',
//                                         viewModel.selectedDates['Spouse'],
//                                         viewModel,
//                                       ),
//                                     if (title == 'Children' &&
//                                         (viewModel.getSonCount() > 0 ||
//                                             viewModel.getDaughterCount() > 0))
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             for (
//                                               int i = 1;
//                                               i <= viewModel.getSonCount();
//                                               i++
//                                             )
//                                               _buildMainScreenDobSummary(
//                                                 'Son $i',
//                                                 viewModel
//                                                     .selectedDates['Son $i'],
//                                                 viewModel,
//                                               ),
//                                             for (
//                                               int i = 1;
//                                               i <= viewModel.getDaughterCount();
//                                               i++
//                                             )
//                                               _buildMainScreenDobSummary(
//                                                 'Daughter $i',
//                                                 viewModel
//                                                     .selectedDates['Daughter $i'],
//                                                 viewModel,
//                                               ),
//                                           ],
//                                         ),
//                                       ),
//                                     if (title == 'Parents and In laws' &&
//                                         viewModel.selectedParents.isNotEmpty)
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             for (var parent
//                                                 in viewModel.selectedParents)
//                                               _buildMainScreenDobSummary(
//                                                 parent,
//                                                 viewModel.selectedDates[parent],
//                                                 viewModel,
//                                               ),
//                                           ],
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                           const SizedBox(height: 20),
//                           const Text(
//                             "Where do you reside?",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           TextFormField(
//                             controller: viewModel.pincodeController,
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                               hintText: "Pincode",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 12,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () => _submitData(context),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                         child: const Text("Continue"),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildMainScreenDobSummary(
//     String memberName,
//     String? dob,
//     PersonalizeViewModel viewModel,
//   ) {
//     if (dob == null || dob.isEmpty) {
//       return Container(); // Don't show anything if DOB is not set
//     }
//     final int? age = viewModel.calculateAge(dob);
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2.0),
//       child: Row(
//         children: [
//           Text(
//             "$memberName:",
//             style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(width: 8),
//           Text(
//             dob,
//             style: const TextStyle(fontSize: 13, color: Colors.black87),
//           ),
//           if (age != null)
//             Text(
//               " (Age: $age years)",
//               style: const TextStyle(fontSize: 13, color: Colors.grey),
//             ),
//         ],
//       ),
//     );
//   }
// }

// 4
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:insurance/features/health/buy_new_policy/health/personalize_viewmodel.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// const List<Map<String, String>> members = [
//   {'title': 'Self', 'icon': '👨‍👩‍👧'},
//   {'title': 'Spouse', 'icon': '💍'},
//   {'title': 'Children', 'icon': '👶'},
//   {'title': 'Parents and In laws', 'icon': '👵'},
// ];
//
// class PersonalizeScreen extends StatelessWidget {
//   const PersonalizeScreen({super.key});
//
//   void _openDobBottomSheet(BuildContext context, String member) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     DateTime selectedDate = viewModel.selectedDates[member] != null
//         ? DateTime.parse(
//             viewModel.selectedDates[member]!.split('-').reversed.join('-'),
//           )
//         : DateTime.now();
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 350,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           member,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Date of Birth",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 150,
//                       child: CupertinoDatePicker(
//                         mode: CupertinoDatePickerMode.date,
//                         initialDateTime: selectedDate,
//                         onDateTimeChanged: (date) {
//                           setSheetState(() => selectedDate = date);
//                         },
//                       ),
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           final dob =
//                               "${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}";
//                           viewModel.updateDate(member, dob);
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Save"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   void _openChildrenBottomSheet(BuildContext context) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     int sonCount = viewModel.getSonCount();
//     int daughterCount = viewModel.getDaughterCount();
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 400,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Children",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const Text(
//                       "(Dependent children below the age of 30)",
//                       style: TextStyle(fontSize: 13, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text("Son"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: sonCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         sonCount--;
//                                         viewModel.updateSonCount(sonCount);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(sonCount.toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         sonCount++;
//                                         viewModel.updateSonCount(sonCount);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text("Daughter"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: daughterCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         daughterCount--;
//                                         viewModel.updateDaughterCount(
//                                           daughterCount,
//                                         );
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(daughterCount.toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         daughterCount++;
//                                         viewModel.updateDaughterCount(
//                                           daughterCount,
//                                         );
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: const Text("Done"),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(11),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   void _openParentsBottomSheet(BuildContext context) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     final selectedMembers = viewModel.selectedParents;
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 500,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Parents and In laws",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     CheckboxListTile(
//                       title: const Text("Mother"),
//                       value: selectedMembers.contains('Mother'),
//                       onChanged: (value) {
//                         setSheetState(() {
//                           if (value!) {
//                             if (!selectedMembers.contains('Mother')) {
//                               selectedMembers.add('Mother');
//                             }
//                           } else {
//                             selectedMembers.remove('Mother');
//                           }
//                           viewModel.updateParents(selectedMembers);
//                         });
//                       },
//                     ),
//                     CheckboxListTile(
//                       title: const Text("Father"),
//                       value: selectedMembers.contains('Father'),
//                       onChanged: (value) {
//                         setSheetState(() {
//                           if (value!) {
//                             if (!selectedMembers.contains('Father')) {
//                               selectedMembers.add('Father');
//                             }
//                           } else {
//                             selectedMembers.remove('Father');
//                           }
//                           viewModel.updateParents(selectedMembers);
//                         });
//                       },
//                     ),
//                     CheckboxListTile(
//                       title: const Text("Mother-in-law"),
//                       value: selectedMembers.contains('Mother-in-law'),
//                       onChanged: (value) {
//                         setSheetState(() {
//                           if (value!) {
//                             if (!selectedMembers.contains('Mother-in-law')) {
//                               selectedMembers.add('Mother-in-law');
//                             }
//                           } else {
//                             selectedMembers.remove('Mother-in-law');
//                           }
//                           viewModel.updateParents(selectedMembers);
//                         });
//                       },
//                     ),
//                     CheckboxListTile(
//                       title: const Text("Father-in-law"),
//                       value: selectedMembers.contains('Father-in-law'),
//                       onChanged: (value) {
//                         setSheetState(() {
//                           if (value!) {
//                             if (!selectedMembers.contains('Father-in-law')) {
//                               selectedMembers.add('Father-in-law');
//                             }
//                           } else {
//                             selectedMembers.remove('Father-in-law');
//                           }
//                           viewModel.updateParents(selectedMembers);
//                         });
//                       },
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: selectedMembers.length,
//                         itemBuilder: (context, index) {
//                           final member = selectedMembers[index];
//                           final dob =
//                               viewModel.selectedDates[member] ?? 'Set DOB';
//                           return ListTile(
//                             title: Text(member),
//                             trailing: GestureDetector(
//                               onTap: () => _openDobBottomSheet(context, member),
//                               child: Text(
//                                 dob,
//                                 style: TextStyle(
//                                   color: viewModel.selectedDates[member] != null
//                                       ? Colors.blue
//                                       : Colors.grey,
//                                   decoration:
//                                       viewModel.selectedDates[member] != null
//                                       ? TextDecoration.underline
//                                       : null,
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: const Text("Add Member"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> _submitData(BuildContext context) async {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     final selectedDates = viewModel.selectedDates;
//
//     if (kDebugMode) {
//       print('Selected Dates on Submit: $selectedDates');
//     }
//
//     String? reformatDate(String date) {
//       if (date.isEmpty) return null;
//       final parts = date.split('-');
//       if (parts.length == 3) {
//         try {
//           return "${parts[2]}-${parts[1]}-${parts[0]}";
//         } catch (e) {
//           print('Date parsing error for $date: $e');
//           return date;
//         }
//       }
//       return date;
//     }
//
//     final payload = {
//       "self_dob": reformatDate(selectedDates['Self'] ?? ""),
//       "spouse_dob": reformatDate(selectedDates['Spouse'] ?? ""),
//       "son1_dob": reformatDate(selectedDates['Son 1'] ?? ""),
//       "son2_dob": reformatDate(selectedDates['Son 2'] ?? ""),
//       "son3_dob": reformatDate(selectedDates['Son 3'] ?? ""),
//       "son4_dob": reformatDate(selectedDates['Son 4'] ?? ""),
//       "daughter1_dob": reformatDate(selectedDates['Daughter 1'] ?? ""),
//       "daughter2_dob": reformatDate(selectedDates['Daughter 2'] ?? ""),
//       "daughter3_dob": reformatDate(selectedDates['Daughter 3'] ?? ""),
//       "daughter4_dob": reformatDate(selectedDates['Daughter 4'] ?? ""),
//       "mother_dob": reformatDate(selectedDates['Mother'] ?? ""),
//       "father_dob": reformatDate(selectedDates['Father'] ?? ""),
//       "mother_in_law_dob": reformatDate(selectedDates['Mother-in-law'] ?? ""),
//       "father_in_law_dob": reformatDate(selectedDates['Father-in-law'] ?? ""),
//       "pincode": viewModel.pincodeController.text,
//     };
//
//     payload.removeWhere(
//       (key, value) => value == null || (value is String && value.isEmpty),
//     );
//
//     if (kDebugMode) {
//       print('API Payload: $payload');
//     }
//
//     if (kDebugMode) {
//       try {
//         final response = await http.post(
//           Uri.parse('http://192.168.1.14:8000/api/family-members/'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode(payload),
//         );
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           print('API Success: ${response.body}');
//         } else {
//           print('API Error: ${response.statusCode} - ${response.body}');
//         }
//       } catch (e) {
//         print('API Exception: $e');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => PersonalizeViewModel(),
//       child: Consumer<PersonalizeViewModel>(
//         builder: (context, viewModel, child) {
//           return DraggableScrollableSheet(
//             initialChildSize: 0.75,
//             maxChildSize: 0.80,
//             minChildSize: 0.6,
//             builder: (_, controller) {
//               return Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 10,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Personalize",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: const Icon(Icons.close),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: ListView(
//                         controller: controller,
//                         children: [
//                           const Text(
//                             "Hi Yogesh, who are you insuring?",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           const Text(
//                             "You can select multiple members (upto 6)",
//                             style: TextStyle(fontSize: 13, color: Colors.grey),
//                           ),
//                           const SizedBox(height: 12),
//                           ...members.map((item) {
//                             final title = item['title']!;
//                             final icon = item['icon']!;
//                             final selectedDob = viewModel.selectedDates[title];
//
//                             return GestureDetector(
//                               onTap: () {
//                                 if (title == 'Children') {
//                                   _openChildrenBottomSheet(context);
//                                 } else if (title == 'Parents and In laws') {
//                                   _openParentsBottomSheet(context);
//                                 } else {
//                                   _openDobBottomSheet(context, title);
//                                 }
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(vertical: 6),
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: selectedDob != null
//                                         ? Colors.green
//                                         : Colors.grey.shade300,
//                                     width: selectedDob != null ? 2 : 1,
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           icon,
//                                           style: const TextStyle(fontSize: 20),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Expanded(
//                                           child: Text(
//                                             title,
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ),
//                                         Icon(
//                                           selectedDob != null
//                                               ? Icons.check_circle
//                                               : Icons.radio_button_off,
//                                           color: selectedDob != null
//                                               ? Colors.green
//                                               : Colors.grey,
//                                         ),
//                                       ],
//                                     ),
//                                     if (title == 'Children' &&
//                                         (viewModel.getSonCount() > 0 ||
//                                             viewModel.getDaughterCount() > 0))
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             for (
//                                               int i = 1;
//                                               i <= viewModel.getSonCount();
//                                               i++
//                                             )
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     "Son $i",
//                                                     style: const TextStyle(
//                                                       fontSize: 13,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 8),
//                                                   GestureDetector(
//                                                     onTap: () =>
//                                                         _openDobBottomSheet(
//                                                           context,
//                                                           'Son $i',
//                                                         ),
//                                                     child: Text(
//                                                       viewModel
//                                                               .selectedDates['Son $i'] ??
//                                                           'Set DOB',
//                                                       style: TextStyle(
//                                                         fontSize: 13,
//                                                         color:
//                                                             viewModel
//                                                                     .selectedDates['Son $i'] !=
//                                                                 null
//                                                             ? Colors.black87
//                                                             : Colors.grey,
//                                                         decoration:
//                                                             viewModel
//                                                                     .selectedDates['Son $i'] !=
//                                                                 null
//                                                             ? null
//                                                             : TextDecoration
//                                                                   .underline,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             for (
//                                               int i = 1;
//                                               i <= viewModel.getDaughterCount();
//                                               i++
//                                             )
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     "Daughter $i",
//                                                     style: const TextStyle(
//                                                       fontSize: 13,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 8),
//                                                   GestureDetector(
//                                                     onTap: () =>
//                                                         _openDobBottomSheet(
//                                                           context,
//                                                           'Daughter $i',
//                                                         ),
//                                                     child: Text(
//                                                       viewModel
//                                                               .selectedDates['Daughter $i'] ??
//                                                           'Set DOB',
//                                                       style: TextStyle(
//                                                         fontSize: 13,
//                                                         color:
//                                                             viewModel
//                                                                     .selectedDates['Daughter $i'] !=
//                                                                 null
//                                                             ? Colors.black87
//                                                             : Colors.grey,
//                                                         decoration:
//                                                             viewModel
//                                                                     .selectedDates['Daughter $i'] !=
//                                                                 null
//                                                             ? null
//                                                             : TextDecoration
//                                                                   .underline,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                           ],
//                                         ),
//                                       )
//                                     else if (title == 'Parents and In laws' &&
//                                         viewModel.selectedParents.isNotEmpty)
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             for (var member
//                                                 in viewModel.selectedParents)
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     member,
//                                                     style: const TextStyle(
//                                                       fontSize: 13,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 8),
//                                                   GestureDetector(
//                                                     onTap: () =>
//                                                         _openDobBottomSheet(
//                                                           context,
//                                                           member,
//                                                         ),
//                                                     child: Text(
//                                                       viewModel
//                                                               .selectedDates[member] ??
//                                                           'Set DOB',
//                                                       style: TextStyle(
//                                                         fontSize: 13,
//                                                         color:
//                                                             viewModel
//                                                                     .selectedDates[member] !=
//                                                                 null
//                                                             ? Colors.black87
//                                                             : Colors.grey,
//                                                         decoration:
//                                                             viewModel
//                                                                     .selectedDates[member] !=
//                                                                 null
//                                                             ? null
//                                                             : TextDecoration
//                                                                   .underline,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                           ],
//                                         ),
//                                       )
//                                     else if (selectedDob != null)
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Row(
//                                           children: [
//                                             const Text(
//                                               "Date of Birth: ",
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                             Text(
//                                               selectedDob,
//                                               style: const TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.black87,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                           const SizedBox(height: 16),
//                           const Text(
//                             "Where do you reside?",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           TextField(
//                             controller: viewModel.pincodeController,
//                             decoration: const InputDecoration(
//                               hintText: 'Pincode',
//                               border: OutlineInputBorder(),
//                             ),
//                             keyboardType: TextInputType.number,
//                           ),
//                           const SizedBox(height: 11),
//                           SafeArea(
//                             child: SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () => _submitData(context),
//                                 child: const Text("Continue"),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// api 1
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:insurance/features/health/buy_new_policy/health/personalize_viewmodel.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// const List<Map<String, String>> members = [
//   {'title': 'Self', 'icon': '👨‍👩‍👧'},
//   {'title': 'Spouse', 'icon': '💍'},
//   {'title': 'Children', 'icon': '👶'},
//   {'title': 'Parents and In laws', 'icon': '👵'},
// ];
//
// class PersonalizeScreen extends StatelessWidget {
//   const PersonalizeScreen({super.key});
//
//   void _openDobBottomSheet(BuildContext context, String member) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     DateTime selectedDate = DateTime.now();
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 350,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           member,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Date of Birth",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 150,
//                       child: CupertinoDatePicker(
//                         mode: CupertinoDatePickerMode.date,
//                         initialDateTime: selectedDate,
//                         onDateTimeChanged: (date) {
//                           setSheetState(() => selectedDate = date);
//                         },
//                       ),
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           final dob =
//                               "${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}";
//                           viewModel.updateDate(member, dob);
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Save"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   void _openChildrenBottomSheet(BuildContext context) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     int sonCount = viewModel.getSonCount();
//     int daughterCount = viewModel.getDaughterCount();
//     Map<String, String> childDates = Map.fromEntries(
//       viewModel.selectedDates.entries.where(
//         (entry) =>
//             entry.key.startsWith('Son') || entry.key.startsWith('Daughter'),
//       ),
//     );
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 500,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Children",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const Text(
//                       "(Dependent children below the age of 30)",
//                       style: TextStyle(fontSize: 13, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text("Son"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: sonCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         sonCount--;
//                                         final keyToRemove = "Son $sonCount";
//                                         viewModel.removeChild(keyToRemove);
//                                         childDates.remove(keyToRemove);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(sonCount.toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         sonCount++;
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text("Daughter"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: daughterCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         daughterCount--;
//                                         final keyToRemove =
//                                             "Daughter $daughterCount";
//                                         viewModel.removeChild(keyToRemove);
//                                         childDates.remove(keyToRemove);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(daughterCount.toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         daughterCount++;
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: sonCount + daughterCount,
//                         itemBuilder: (context, index) {
//                           String childType = index < sonCount
//                               ? "Son ${index + 1}"
//                               : "Daughter ${index - sonCount + 1}";
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(childType),
//                                 const SizedBox(height: 8),
//                                 TextField(
//                                   onTap: () =>
//                                       _openDobBottomSheet(context, childType),
//                                   decoration: InputDecoration(
//                                     hintText: "Date of Birth",
//                                     suffixIcon: const Icon(
//                                       Icons.calendar_today,
//                                     ),
//                                   ),
//                                   controller: TextEditingController(
//                                     text: childDates[childType] ?? '',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           childDates.forEach((key, value) {
//                             viewModel.updateDate(key, value);
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Add Member"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Future<void> _submitData(BuildContext context) async {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     final selectedDates = viewModel.selectedDates;
//
//     // Print selected dates only in debug mode before API call
//     if (kDebugMode) {
//       print('Selected Dates on Submit: $selectedDates');
//     }
//
//     // Function to reformat date from DD-MM-YYYY to YYYY-MM-DD
//     String? reformatDate(String date) {
//       if (date.isEmpty) return null;
//       final parts = date.split('-');
//       if (parts.length == 3) {
//         try {
//           return "${parts[2]}-${parts[1]}-${parts[0]}"; // YYYY-MM-DD
//         } catch (e) {
//           print('Date parsing error for $date: $e');
//           return date;
//         }
//       }
//       return date;
//     }
//
//     // Prepare API payload with all fields, using null for unset values
//     final payload = {
//       "self_dob": reformatDate(selectedDates['Self'] ?? ""),
//       "spouse_dob": reformatDate(selectedDates['Spouse'] ?? ""),
//       "son1_dob": reformatDate(selectedDates['Son 1'] ?? ""),
//       "son2_dob": reformatDate(selectedDates['Son 2'] ?? ""),
//       "son3_dob": reformatDate(selectedDates['Son 3'] ?? ""),
//       "son4_dob": reformatDate(selectedDates['Son 4'] ?? ""),
//       "daughter1_dob": reformatDate(selectedDates['Daughter 1'] ?? ""),
//       "daughter2_dob": reformatDate(selectedDates['Daughter 2'] ?? ""),
//       "daughter3_dob": reformatDate(selectedDates['Daughter 3'] ?? ""),
//       "daughter4_dob": reformatDate(selectedDates['Daughter 4'] ?? ""),
//       "mother_dob": reformatDate(
//         selectedDates['Parents and In laws']?.split(',')[0] ?? "",
//       ),
//       "father_dob": reformatDate(
//         selectedDates['Parents and In laws']?.split(',')[1] ?? "",
//       ),
//       "mother_in_law_dob": reformatDate(""),
//       "father_in_law_dob": reformatDate(""),
//       "pincode": viewModel.pincodeController.text,
//     };
//
//     // Remove null values and empty fields from the payload to match the minimal request structure
//     payload.removeWhere(
//       (key, value) => value == null || (value is String && value.isEmpty),
//     );
//
//     // Debug print the payload to verify
//     if (kDebugMode) {
//       print('API Payload: $payload');
//     }
//
//     // API call in debug mode
//     if (kDebugMode) {
//       try {
//         final response = await http.post(
//           Uri.parse('http://192.168.1.14:8000/api/family-members/'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode(payload),
//         );
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           print('API Success: ${response.body}');
//         } else {
//           print('API Error: ${response.statusCode} - ${response.body}');
//         }
//       } catch (e) {
//         print('API Exception: $e');
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => PersonalizeViewModel(),
//       child: Consumer<PersonalizeViewModel>(
//         builder: (context, viewModel, child) {
//           // Create and manage pincodeController within the build method
//           // final pincodeController = TextEditingController();
//
//           return DraggableScrollableSheet(
//             initialChildSize: 0.75,
//             maxChildSize: 0.80,
//             minChildSize: 0.6,
//             builder: (_, controller) {
//               return Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 10,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Personalize",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: const Icon(Icons.close),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: ListView(
//                         controller: controller,
//                         children: [
//                           const Text(
//                             "Hi Yogesh, who are you insuring?",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           const Text(
//                             "You can select multiple members (upto 6)",
//                             style: TextStyle(fontSize: 13, color: Colors.grey),
//                           ),
//                           const SizedBox(height: 12),
//                           ...members.map((item) {
//                             final title = item['title']!;
//                             final icon = item['icon']!;
//                             final selectedDob = viewModel.selectedDates[title];
//
//                             return GestureDetector(
//                               onTap: () {
//                                 if (title == 'Children') {
//                                   _openChildrenBottomSheet(context);
//                                 } else {
//                                   _openDobBottomSheet(context, title);
//                                 }
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(vertical: 6),
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: selectedDob != null
//                                         ? Colors.green
//                                         : Colors.grey.shade300,
//                                     width: selectedDob != null ? 2 : 1,
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           icon,
//                                           style: const TextStyle(fontSize: 20),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Expanded(
//                                           child: Text(
//                                             title,
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ),
//                                         Icon(
//                                           selectedDob != null
//                                               ? Icons.check_circle
//                                               : Icons.radio_button_off,
//                                           color: selectedDob != null
//                                               ? Colors.green
//                                               : Colors.grey,
//                                         ),
//                                       ],
//                                     ),
//                                     if (title == 'Children' &&
//                                         viewModel.selectedDates.isNotEmpty)
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             ...viewModel.selectedDates.entries
//                                                 .where(
//                                                   (entry) =>
//                                                       entry.key.startsWith(
//                                                         'Son',
//                                                       ) ||
//                                                       entry.key.startsWith(
//                                                         'Daughter',
//                                                       ),
//                                                 )
//                                                 .map(
//                                                   (entry) => Row(
//                                                     children: [
//                                                       Text(
//                                                         "${entry.key}: ",
//                                                         style: const TextStyle(
//                                                           fontSize: 13,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                       ),
//                                                       Text(
//                                                         entry.value,
//                                                         style: const TextStyle(
//                                                           fontSize: 13,
//                                                           color: Colors.black87,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                           ],
//                                         ),
//                                       )
//                                     else if (selectedDob != null)
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Row(
//                                           children: [
//                                             const Text(
//                                               "Date of Birth: ",
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                             Text(
//                                               selectedDob,
//                                               style: const TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.black87,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                           const SizedBox(height: 16),
//                           const Text(
//                             "Where do you reside?",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           TextField(
//                             controller: viewModel.pincodeController,
//                             decoration: const InputDecoration(
//                               hintText: 'Pincode',
//                               border: OutlineInputBorder(),
//                             ),
//                             keyboardType: TextInputType.number,
//                           ),
//                           const SizedBox(height: 11),
//                           SafeArea(
//                             child: SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () => _submitData(context),
//                                 child: const Text("Continue"),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// 4
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:insurance/features/health/buy_new_policy/health/personalize_viewmodel.dart'
//     show PersonalizeViewModel;
// // import 'package:insurance/features/health/buy_new_policy/health/personalize_viewmodel.dart';
// import 'package:provider/provider.dart';
//
// // Define members as a constant outside the class
// const List<Map<String, String>> members = [
//   {'title': 'Self', 'icon': '👨‍👩‍👧'},
//   {'title': 'Spouse', 'icon': '💍'},
//   {'title': 'Children', 'icon': '👶'},
//   {'title': 'Parents and In laws', 'icon': '👵'},
// ];
//
// class PersonalizeScreen extends StatelessWidget {
//   const PersonalizeScreen({super.key});
//
//   void _openDobBottomSheet(BuildContext context, String member) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     DateTime selectedDate = DateTime.now();
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 350,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           member,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Date of Birth",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 150,
//                       child: CupertinoDatePicker(
//                         mode: CupertinoDatePickerMode.date,
//                         initialDateTime: selectedDate,
//                         onDateTimeChanged: (date) {
//                           setSheetState(() => selectedDate = date);
//                         },
//                       ),
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           final dob =
//                               "${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}";
//                           viewModel.updateDate(member, dob);
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Save"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   void _openChildrenBottomSheet(BuildContext context) {
//     final viewModel = Provider.of<PersonalizeViewModel>(context, listen: false);
//     int sonCount = viewModel.getSonCount();
//     int daughterCount = viewModel.getDaughterCount();
//     Map<String, String> childDates = Map.fromEntries(
//       viewModel.selectedDates.entries.where(
//         (entry) =>
//             entry.key.startsWith('Son') || entry.key.startsWith('Daughter'),
//       ),
//     );
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 500,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Children",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const Text(
//                       "(Dependent children below the age of 30)",
//                       style: TextStyle(fontSize: 13, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text("Son"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: sonCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         sonCount--;
//                                         final keyToRemove = "Son $sonCount";
//                                         viewModel.removeChild(keyToRemove);
//                                         childDates.remove(keyToRemove);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(sonCount.toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         sonCount++;
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text("Daughter"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: daughterCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         daughterCount--;
//                                         final keyToRemove =
//                                             "Daughter $daughterCount";
//                                         viewModel.removeChild(keyToRemove);
//                                         childDates.remove(keyToRemove);
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(daughterCount.toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         daughterCount++;
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: sonCount + daughterCount,
//                         itemBuilder: (context, index) {
//                           String childType = index < sonCount
//                               ? "Son ${index + 1}"
//                               : "Daughter ${index - sonCount + 1}";
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(childType),
//                                 const SizedBox(height: 8),
//                                 TextField(
//                                   onTap: () =>
//                                       _openDobBottomSheet(context, childType),
//                                   decoration: InputDecoration(
//                                     hintText: "Date of Birth",
//                                     suffixIcon: const Icon(
//                                       Icons.calendar_today,
//                                     ),
//                                   ),
//                                   controller: TextEditingController(
//                                     text: childDates[childType] ?? '',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           childDates.forEach((key, value) {
//                             viewModel.updateDate(key, value);
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Add Member"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => PersonalizeViewModel(),
//       child: Consumer<PersonalizeViewModel>(
//         builder: (context, viewModel, child) {
//           return DraggableScrollableSheet(
//             initialChildSize: 0.75,
//             maxChildSize: 0.80,
//             minChildSize: 0.6,
//             builder: (_, controller) {
//               return Container(
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 10,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Personalize",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: const Icon(Icons.close),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: ListView(
//                         controller: controller,
//                         children: [
//                           const Text(
//                             "Hi Yogesh, who are you insuring?",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 2),
//                           const Text(
//                             "You can select multiple members (upto 6)",
//                             style: TextStyle(fontSize: 13, color: Colors.grey),
//                           ),
//                           const SizedBox(height: 12),
//                           ...members.map((item) {
//                             final title = item['title']!;
//                             final icon = item['icon']!;
//                             final selectedDob = viewModel.selectedDates[title];
//
//                             return GestureDetector(
//                               onTap: () {
//                                 if (title == 'Children') {
//                                   _openChildrenBottomSheet(context);
//                                 } else {
//                                   _openDobBottomSheet(context, title);
//                                 }
//                               },
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(vertical: 6),
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: selectedDob != null
//                                         ? Colors.green
//                                         : Colors.grey.shade300,
//                                     width: selectedDob != null ? 2 : 1,
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text(
//                                           icon,
//                                           style: const TextStyle(fontSize: 20),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Expanded(
//                                           child: Text(
//                                             title,
//                                             style: const TextStyle(
//                                               fontSize: 16,
//                                             ),
//                                           ),
//                                         ),
//                                         Icon(
//                                           selectedDob != null
//                                               ? Icons.check_circle
//                                               : Icons.radio_button_off,
//                                           color: selectedDob != null
//                                               ? Colors.green
//                                               : Colors.grey,
//                                         ),
//                                       ],
//                                     ),
//                                     if (title == 'Children' &&
//                                         viewModel.selectedDates.isNotEmpty)
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             ...viewModel.selectedDates.entries
//                                                 .where(
//                                                   (entry) =>
//                                                       entry.key.startsWith(
//                                                         'Son',
//                                                       ) ||
//                                                       entry.key.startsWith(
//                                                         'Daughter',
//                                                       ),
//                                                 )
//                                                 .map(
//                                                   (entry) => Row(
//                                                     children: [
//                                                       Text(
//                                                         "${entry.key}: ",
//                                                         style: const TextStyle(
//                                                           fontSize: 13,
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                         ),
//                                                       ),
//                                                       Text(
//                                                         entry.value,
//                                                         style: const TextStyle(
//                                                           fontSize: 13,
//                                                           color: Colors.black87,
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                           ],
//                                         ),
//                                       )
//                                     else if (selectedDob != null)
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                           top: 6,
//                                           left: 32,
//                                         ),
//                                         child: Row(
//                                           children: [
//                                             const Text(
//                                               "Date of Birth: ",
//                                               style: TextStyle(
//                                                 fontSize: 13,
//                                                 fontWeight: FontWeight.w500,
//                                               ),
//                                             ),
//                                             Text(
//                                               selectedDob,
//                                               style: const TextStyle(
//                                                 fontSize: 13,
//                                                 color: Colors.black87,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                           const SizedBox(height: 16),
//                           const Text(
//                             "Where do you reside?",
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           const TextField(
//                             decoration: InputDecoration(
//                               hintText: 'Pincode',
//                               border: OutlineInputBorder(),
//                             ),
//                             keyboardType: TextInputType.number,
//                           ),
//                           const SizedBox(height: 11),
//                           SafeArea(
//                             child: SizedBox(
//                               width: double.infinity,
//                               child: ElevatedButton(
//                                 onPressed: () {
//                                   // Navigator.pop(context);
//                                   Future<void> _submitData(
//                                     BuildContext context,
//                                   ) async {
//                                     final viewModel =
//                                         Provider.of<PersonalizeViewModel>(
//                                           context,
//                                           listen: false,
//                                         );
//                                     final selectedDates =
//                                         viewModel.selectedDates;
//
//                                     // Print selected dates only in debug mode
//                                     if (kDebugMode) {
//                                       print(
//                                         'Selected Dates on Submit: $selectedDates',
//                                       );
//                                     }
//                                   }
//                                 },
//                                 child: const Text("Continue"),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// 3
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class PersonalizeScreen extends StatefulWidget {
//   const PersonalizeScreen({super.key});
//
//   @override
//   State<PersonalizeScreen> createState() => _PersonalizeScreenState();
// }
//
// class _PersonalizeScreenState extends State<PersonalizeScreen> {
//   Map<String, String> selectedDates = {};
//
//   final members = [
//     {'title': 'Self', 'icon': '👨‍👩‍👧'},
//     {'title': 'Spouse', 'icon': '💍'},
//     {'title': 'Children', 'icon': '👶'},
//     {'title': 'Parents and In laws', 'icon': '👵'},
//   ];
//
//   void _openDobBottomSheet(String member, Function(String) onDateSelected) {
//     DateTime selectedDate = DateTime.now();
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 350,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           member,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Date of Birth",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 150,
//                       child: CupertinoDatePicker(
//                         mode: CupertinoDatePickerMode.date,
//                         initialDateTime: selectedDate,
//                         onDateTimeChanged: (date) {
//                           setSheetState(() => selectedDate = date);
//                         },
//                       ),
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           final dob =
//                               "${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}";
//                           onDateSelected(dob);
//                           setState(() {
//                             selectedDates[member] = dob;
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Save"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   void _openChildrenBottomSheet() {
//     int sonCount = selectedDates.keys
//         .where((key) => key.startsWith('Son'))
//         .length;
//     int daughterCount = selectedDates.keys
//         .where((key) => key.startsWith('Daughter'))
//         .length;
//     Map<String, String> childDates = Map.fromEntries(
//       selectedDates.entries.where(
//         (entry) =>
//             entry.key.startsWith('Son') || entry.key.startsWith('Daughter'),
//       ),
//     );
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 500,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "Children",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const Text(
//                       "(Dependent children below the age of 30)",
//                       style: TextStyle(fontSize: 13, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text("Son"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: sonCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         sonCount--;
//                                         final keyToRemove = "Son $sonCount";
//                                         setState(() {
//                                           selectedDates.remove(keyToRemove);
//                                           childDates.remove(keyToRemove);
//                                         });
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(sonCount.toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         sonCount++;
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text("Daughter"),
//                         Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(Icons.remove_circle_outline),
//                               onPressed: daughterCount > 0
//                                   ? () {
//                                       setSheetState(() {
//                                         daughterCount--;
//                                         final keyToRemove =
//                                             "Daughter $daughterCount";
//                                         setState(() {
//                                           selectedDates.remove(keyToRemove);
//                                           childDates.remove(keyToRemove);
//                                         });
//                                       });
//                                     }
//                                   : null,
//                             ),
//                             Text(daughterCount.toString()),
//                             IconButton(
//                               icon: const Icon(Icons.add_circle_outline),
//                               onPressed: sonCount + daughterCount < 4
//                                   ? () {
//                                       setSheetState(() {
//                                         daughterCount++;
//                                       });
//                                     }
//                                   : null,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: sonCount + daughterCount,
//                         itemBuilder: (context, index) {
//                           String childType = index < sonCount
//                               ? "Son ${index + 1}"
//                               : "Daughter ${index - sonCount + 1}";
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(childType),
//                                 const SizedBox(height: 8),
//                                 TextField(
//                                   onTap: () =>
//                                       _openDobBottomSheet(childType, (dob) {
//                                         setSheetState(() {
//                                           childDates[childType] = dob;
//                                         });
//                                       }),
//                                   decoration: InputDecoration(
//                                     hintText: "Date of Birth",
//                                     suffixIcon: const Icon(
//                                       Icons.calendar_today,
//                                     ),
//                                   ),
//                                   controller: TextEditingController(
//                                     text: childDates[childType] ?? '',
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             childDates.forEach((key, value) {
//                               selectedDates[key] = value;
//                             });
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Add Member"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.75,
//       maxChildSize: 0.95,
//       minChildSize: 0.6,
//       builder: (_, controller) {
//         return Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   const Text(
//                     "Personalize",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.close),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: ListView(
//                   controller: controller,
//                   children: [
//                     const Text(
//                       "Hi Yogesh, who are you insuring?",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     const Text(
//                       "You can select multiple members (upto 6)",
//                       style: TextStyle(fontSize: 13, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 12),
//                     ...members.map((item) {
//                       final title = item['title']!;
//                       final icon = item['icon']!;
//                       final selectedDob = selectedDates[title];
//
//                       return GestureDetector(
//                         onTap: () {
//                           if (title == 'Children') {
//                             _openChildrenBottomSheet();
//                           } else {
//                             _openDobBottomSheet(title, (dob) {
//                               setState(() {
//                                 selectedDates[title] = dob;
//                               });
//                             });
//                           }
//                         },
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 6),
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: selectedDob != null
//                                   ? Colors.green
//                                   : Colors.grey.shade300,
//                               width: selectedDob != null ? 2 : 1,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     icon,
//                                     style: const TextStyle(fontSize: 20),
//                                   ),
//                                   const SizedBox(width: 12),
//                                   Expanded(
//                                     child: Text(
//                                       title,
//                                       style: const TextStyle(fontSize: 16),
//                                     ),
//                                   ),
//                                   Icon(
//                                     selectedDob != null
//                                         ? Icons.check_circle
//                                         : Icons.radio_button_off,
//                                     color: selectedDob != null
//                                         ? Colors.green
//                                         : Colors.grey,
//                                   ),
//                                 ],
//                               ),
//                               if (title == 'Children' &&
//                                   selectedDates.isNotEmpty)
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     top: 6,
//                                     left: 32,
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       ...selectedDates.entries
//                                           .where(
//                                             (entry) =>
//                                                 entry.key.startsWith('Son') ||
//                                                 entry.key.startsWith(
//                                                   'Daughter',
//                                                 ),
//                                           )
//                                           .map(
//                                             (entry) => Row(
//                                               children: [
//                                                 Text(
//                                                   "${entry.key}: ",
//                                                   style: const TextStyle(
//                                                     fontSize: 13,
//                                                     fontWeight: FontWeight.w500,
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   entry.value,
//                                                   style: const TextStyle(
//                                                     fontSize: 13,
//                                                     color: Colors.black87,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                     ],
//                                   ),
//                                 )
//                               else if (selectedDob != null)
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     top: 6,
//                                     left: 32,
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       const Text(
//                                         "Date of Birth: ",
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       Text(
//                                         selectedDob,
//                                         style: const TextStyle(
//                                           fontSize: 13,
//                                           color: Colors.black87,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                     const SizedBox(height: 16),
//                     const Text(
//                       "Where do you reside?",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Pincode',
//                         border: OutlineInputBorder(),
//                       ),
//                       keyboardType: TextInputType.number,
//                     ),
//                     const SizedBox(height: 11),
//                     SafeArea(
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("Continue"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// 2
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class PersonalizeScreen extends StatefulWidget {
//   const PersonalizeScreen({super.key});
//
//   @override
//   State<PersonalizeScreen> createState() => _PersonalizeScreenState();
// }
//
// class _PersonalizeScreenState extends State<PersonalizeScreen> {
//   Map<String, String> selectedDates = {};
//
//   final members = [
//     {'title': 'Self', 'icon': '👨‍👩‍👧'},
//     {'title': 'Spouse', 'icon': '💍'},
//     {'title': 'Children', 'icon': '👶'},
//     {'title': 'Parents and In laws', 'icon': '👵'},
//   ];
//
//   void _openDobBottomSheet(String member) {
//     DateTime selectedDate = DateTime.now();
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (_) {
//         return StatefulBuilder(
//           builder: (context, setSheetState) {
//             return Padding(
//               padding: MediaQuery.of(context).viewInsets,
//               child: Container(
//                 padding: const EdgeInsets.all(16),
//                 height: 350,
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           member,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(Icons.close),
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     const Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Date of Birth",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     SizedBox(
//                       height: 150,
//                       child: CupertinoDatePicker(
//                         mode: CupertinoDatePickerMode.date,
//                         initialDateTime: selectedDate,
//                         onDateTimeChanged: (date) {
//                           setSheetState(() => selectedDate = date);
//                         },
//                       ),
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           final dob =
//                               "${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}";
//                           setState(() {
//                             selectedDates[member] = dob;
//                           });
//                           Navigator.pop(context);
//                         },
//                         child: const Text("Save"),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(11),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.75,
//       maxChildSize: 0.95,
//       minChildSize: 0.6,
//       builder: (_, controller) {
//         return Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   const Text(
//                     "Personalize",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.close),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: ListView(
//                   controller: controller,
//                   children: [
//                     const Text(
//                       "Hi Yogesh, who are you insuring?",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 2),
//                     const Text(
//                       "You can select multiple members (upto 6)",
//                       style: TextStyle(fontSize: 13, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 12),
//                     ...members.map((item) {
//                       final title = item['title']!;
//                       final icon = item['icon']!;
//                       final selectedDob = selectedDates[title];
//
//                       return GestureDetector(
//                         onTap: () => _openDobBottomSheet(title),
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 6),
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                               color: selectedDob != null
//                                   ? Colors.green
//                                   : Colors.grey.shade300,
//                               width: selectedDob != null ? 2 : 1,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     icon,
//                                     style: const TextStyle(fontSize: 20),
//                                   ),
//                                   const SizedBox(width: 12),
//                                   Expanded(
//                                     child: Text(
//                                       title,
//                                       style: const TextStyle(fontSize: 16),
//                                     ),
//                                   ),
//                                   Icon(
//                                     selectedDob != null
//                                         ? Icons.check_circle
//                                         : Icons.radio_button_off,
//                                     color: selectedDob != null
//                                         ? Colors.green
//                                         : Colors.grey,
//                                   ),
//                                 ],
//                               ),
//                               if (selectedDob != null)
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                     top: 6,
//                                     left: 32,
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       const Text(
//                                         "Date of Birth: ",
//                                         style: TextStyle(
//                                           fontSize: 13,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                       Text(
//                                         selectedDob,
//                                         style: const TextStyle(
//                                           fontSize: 13,
//                                           color: Colors.black87,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                     const SizedBox(height: 16),
//                     const Text(
//                       "Where do you reside?",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Pincode',
//                         border: OutlineInputBorder(),
//                       ),
//                       keyboardType: TextInputType.number,
//                     ),
//                     const SizedBox(height: 11),
//                     SafeArea(
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Text("Continue"),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// 1
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class PersonalizeScreen extends StatefulWidget {
//   const PersonalizeScreen({super.key});
//
//   @override
//   State<PersonalizeScreen> createState() => _PersonalizeScreenState();
// }
//
// class _PersonalizeScreenState extends State<PersonalizeScreen> {
//   final Map<String, DateTime?> selectedDOB = {
//     'Self': null,
//     'Spouse': null,
//     'Children': null,
//     'Parents and In laws': null,
//   };
//
//   final TextEditingController _pincodeController = TextEditingController();
//
//   void _openBottomSheet(BuildContext context, String title) async {
//     DateTime? pickedDate = await showModalBottomSheet<DateTime>(
//       context: context,
//       isScrollControlled: true,
//       builder: (_) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           height: 300,
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Select DOB for $title",
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton.icon(
//                 onPressed: () async {
//                   final DateTime? picked = await showDatePicker(
//                     context: context,
//                     initialDate: selectedDOB[title] ?? DateTime(2000, 1, 1),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   );
//                   if (picked != null) {
//                     Navigator.pop(context, picked);
//                   }
//                 },
//                 icon: const Icon(Icons.calendar_today),
//                 label: const Text("Pick a date"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//
//     if (pickedDate != null) {
//       setState(() {
//         selectedDOB[title] = pickedDate;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final members = [
//       {'title': 'Self', 'icon': '👨‍👩‍👧'},
//       {'title': 'Spouse', 'icon': '💍'},
//       {'title': 'Children', 'icon': '👶'},
//       {'title': 'Parents and In laws', 'icon': '👵'},
//     ];
//
//     return DraggableScrollableSheet(
//       initialChildSize: 0.9,
//       maxChildSize: 0.95,
//       minChildSize: 0.6,
//       builder: (_, controller) {
//         return Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   const Text(
//                     "Personalize",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     onPressed: () => Navigator.pop(context),
//                     icon: const Icon(Icons.close),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: ListView(
//                   controller: controller,
//                   children: [
//                     const Text(
//                       "Hi Yogesh, who are you insuring?",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const Text(
//                       "You can select multiple members (upto 6)",
//                       style: TextStyle(fontSize: 13, color: Colors.grey),
//                     ),
//                     const SizedBox(height: 12),
//                     ...members.map((item) {
//                       final title = item['title']!;
//                       final icon = item['icon']!;
//                       final dob = selectedDOB[title];
//
//                       return GestureDetector(
//                         onTap: () => _openBottomSheet(context, title),
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(vertical: 6),
//                           padding: const EdgeInsets.all(12),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey.shade300),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     icon,
//                                     style: const TextStyle(fontSize: 20),
//                                   ),
//                                   const SizedBox(width: 12),
//                                   Expanded(
//                                     child: Text(
//                                       title,
//                                       style: const TextStyle(fontSize: 16),
//                                     ),
//                                   ),
//                                   const Icon(
//                                     Icons.calendar_month_outlined,
//                                     size: 20,
//                                   ),
//                                 ],
//                               ),
//                               if (dob != null)
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 6),
//                                   child: Text(
//                                     "DOB: ${DateFormat('dd MMM yyyy').format(dob)}",
//                                     style: const TextStyle(
//                                       fontSize: 13,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                     const SizedBox(height: 16),
//                     const Text(
//                       "Where do you reside?",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     TextField(
//                       controller: _pincodeController,
//                       keyboardType: TextInputType.number,
//                       decoration: const InputDecoration(
//                         hintText: 'Pincode',
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     SafeArea(
//                       top: false,
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           child: const Text(
//                             "Continue",
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
