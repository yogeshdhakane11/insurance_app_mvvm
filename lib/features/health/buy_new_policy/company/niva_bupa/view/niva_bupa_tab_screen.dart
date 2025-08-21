import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NivaBupaFlexibleTabWidget extends StatefulWidget {
  @override
  _NivaBupaFlexibleTabWidgetState createState() =>
      _NivaBupaFlexibleTabWidgetState();
}

class _NivaBupaFlexibleTabWidgetState extends State<NivaBupaFlexibleTabWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTabIndex = 0;
  Map<String, bool> riderSelections = {
    'Safeguard': false,
    'Personal Accident Cover': false,
    'Hospital Cash': false,
    'Disease Management': false,
    'Acute Care': false,
  };
  bool _isPortabilitySelected = false;
  TextEditingController _expiryDateController = TextEditingController();
  String? _expiryDateError;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _expiryDateController.dispose();
    super.dispose();
  }

  void _showPortabilityBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Portability',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/logo.png', // Replace with your image asset path
                  height: 100,
                ),
                SizedBox(height: 16),
                Text(
                  'Benefits:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '✓ Policy portability helps you to carry forward the waiting period served and might also provide better coverage and lower premium.',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                SizedBox(height: 8),
                Text(
                  'Conditions:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Portability is only permitted at policy renewal time and before 7-60 days of policy expiry. Only the member(s) of the existing insured policy will enjoy the portability benefits',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                ),
                SizedBox(height: 16),

                // TextField(
                //   controller: _expiryDateController,
                //   readOnly: true,
                //   decoration: InputDecoration(
                //     labelText: 'Expiry Date',
                //     suffixIcon: IconButton(
                //       icon: Icon(Icons.calendar_today),
                //       onPressed: () {
                //         showModalBottomSheet(
                //           context: context,
                //           isScrollControlled: true,
                //           backgroundColor: Colors.white,
                //           shape: const RoundedRectangleBorder(
                //             borderRadius: BorderRadius.vertical(
                //               top: Radius.circular(20),
                //             ),
                //           ),
                //           builder: (_) => Container(
                //             height: 250,
                //             child: Column(
                //               children: [
                //                 Padding(
                //                   padding: const EdgeInsets.all(16),
                //                   child: Row(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       Text(
                //                         'Select Expiry Date',
                //                         style: TextStyle(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.bold,
                //                         ),
                //                       ),
                //                       IconButton(
                //                         icon: Icon(Icons.close),
                //                         onPressed: () => Navigator.pop(context),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 221,
                //                   child: CupertinoDatePicker(
                //                     mode: CupertinoDatePickerMode.date,
                //                     initialDateTime: DateTime.now(),
                //                     maximumDate: DateTime(2030),
                //                     onDateTimeChanged: (DateTime newDate) {
                //                       setState(() {
                //                         _expiryDateController.text =
                //                             "${newDate.day}/${newDate.month}/${newDate.year}";
                //                         _expiryDateError = null;
                //                       });
                //                     },
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //         );
                //       },
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8),
                //     ),
                //   ),
                // ),
                // if (_expiryDateError != null)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 8),
                //     child: Text(
                //       _expiryDateError!,
                //       style: TextStyle(color: Colors.red, fontSize: 12),
                //     ),
                //   ),
                Text(
                  'Expiry Date',
                  style: TextStyle(
                    fontSize: 16, // Fixed font size
                  ),
                ),
                TextFormField(
                  controller: _expiryDateController,
                  readOnly: true, // Prevents manual text input
                  onTap: () async {
                    DateTime selectedDate = DateTime.now();
                    bool isDateSelected = false;

                    // Format the date initially
                    String displayMonth = DateFormat.MMMM().format(
                      selectedDate,
                    ); // Full month name
                    String displayDay = selectedDate.day.toString();
                    String displayYear = selectedDate.year.toString();

                    await showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 340, // Fixed height
                          padding: EdgeInsets.only(
                            top: 16, // Fixed padding
                          ),
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          color: CupertinoColors.systemBackground.resolveFrom(
                            context,
                          ),
                          child: Column(
                            children: [
                              // Title
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16, // Fixed padding
                                ),
                                child: Text(
                                  'Select Expiry Date',
                                  style: TextStyle(
                                    fontSize: 16, // Fixed font size
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              // Date Picker
                              Container(
                                height: 200, // Fixed height
                                child: CupertinoDatePicker(
                                  initialDateTime: selectedDate,
                                  mode: CupertinoDatePickerMode.date,
                                  use24hFormat: true,
                                  onDateTimeChanged: (DateTime newDate) {
                                    selectedDate = newDate;
                                    displayMonth = DateFormat.MMMM().format(
                                      newDate,
                                    );
                                    displayDay = newDate.day.toString();
                                    displayYear = newDate.year.toString();
                                  },
                                ),
                              ),
                              // Save Button
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16, // Fixed padding
                                  vertical: 8, // Fixed padding
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    isDateSelected = true;
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        12,
                                      ), // Fixed radius
                                    ),
                                  ),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      fontSize: 18, // Fixed font size
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                    // Update the text field only if Save button is pressed
                    if (isDateSelected) {
                      _expiryDateController.text =
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Expiry Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12), // Fixed radius
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12, // Fixed padding
                      horizontal: 16, // Fixed padding
                    ),
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      size: 24, // Fixed icon size
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a Expiry Date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // if (_expiryDateController.text.isEmpty) {
                    //   setState(() {
                    //     _expiryDateError =
                    //         "Expiry Date: Please select the date";
                    //   });
                    // } else {
                    //   Navigator.pop(context);
                    //   // Handle portability check logic here
                    // }
                  },
                  child: Text('Check Portability'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showHospitalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hospitals',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 24),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search hospital name',
                    prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '85 hospitals in Ahmed nagar',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildHospitalListItem(
                    'AHMEDNAGAR APEX MULTISPECILITY HOSPITAL',
                    'Nagar-Manmad Raodnear Parichay Hotel Savedi, Ahmed nagar - 414003',
                  ),
                  _buildHospitalListItem(
                    'AKSHAY CHILDRENS HOSPITAL AND MATERNITY HOME',
                    'Near Cosmic Housing Societyball Kashram Road, Ahmed nagar - 414001',
                  ),
                  _buildHospitalListItem(
                    'Aarogyam Agrawal Hospital',
                    'Near Swami Samarth Mandirsavedi Roadahmednagar, Ahmed nagar - 414003',
                  ),
                  _buildHospitalListItem(
                    'Akolkar Hospital',
                    'Near I.T.I College Burudgaon Road, Ahmed nagar - 414001',
                  ),
                  _buildHospitalListItem(
                    'BADE MULTISPECIALITY HOSPITAL',
                    'Station Road, Ahmed nagar - 414001',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHospitalListItem(String name, String address) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            address,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _tabController.animateTo(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)]
                : null,
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRidersContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Riders are additional benefits which you can opt for along with your current health insurance policy at affordable rates.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            height: 1.4,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Add Riders",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 16),
        _buildRiderOption(
          "Safeguard",
          "2 variants available",
          "Safeguard",
          hasDiscount: false,
        ),
        _buildRiderOption(
          "Personal Accident Cover",
          "Cover upto 5 times of sum insured (Max upto 1Cr)",
          "Personal Accident Cover",
          hasDiscount: false,
        ),
        _buildRiderOption(
          "Hospital Cash",
          "Claim non-medical expenses during hospitalisation such as transport, food, accommodation",
          "Hospital Cash",
          hasDiscount: false,
        ),
        _buildRiderOption(
          "Disease Management",
          "Coverage from day 1 for hypertension and diabetes",
          "Disease Management",
          hasDiscount: true,
        ),
        _buildRiderOption(
          "Acute Care",
          "Best care with unlimited tele-consultations",
          "Acute Care",
          hasDiscount: true,
        ),
        SizedBox(height: 20),
        Text(
          "Policy Portability",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _isPortabilitySelected = !_isPortabilitySelected;
              if (_isPortabilitySelected &&
                  _expiryDateController.text.isEmpty) {
                _showPortabilityBottomSheet();
              }
            });
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 12),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Port your existing health policy to carry forward your waiting period?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isPortabilitySelected ? Colors.blue : Colors.grey,
                      width: 2,
                    ),
                    color: _isPortabilitySelected
                        ? Colors.blue
                        : Colors.transparent,
                  ),
                  child: _isPortabilitySelected
                      ? Icon(Icons.check, color: Colors.white, size: 16)
                      : null,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildRiderOption(
    String title,
    String description,
    String key, {
    bool hasDiscount = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          riderSelections[key] = !riderSelections[key]!;
        });
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                  if (hasDiscount) ...[
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "Discount Available",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: riderSelections[key]! ? Colors.blue : Colors.grey,
                  width: 2,
                ),
                color: riderSelections[key]! ? Colors.blue : Colors.transparent,
              ),
              child: riderSelections[key]!
                  ? Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Covered",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        _buildHighlightItem("Unlimited restoration of sum insured"),
        _buildHighlightItem(
          "Carry forward unused base sum insured upto 3X to 10X",
        ),
        _buildHighlightItem("Hospitalisation of 2 hrs+ is covered"),
        _buildHighlightItem("Free annual health check-up"),
        _buildHighlightItem("Pre-hospitalization coverage before 60 days"),
        _buildHighlightItem("Post-hospitalization coverage upto 180 days"),
        _buildHighlightItem("Hospitalization at home upto SI"),
        _buildHighlightItem("Ambulance charges upto SI"),
        _buildHighlightItem("No Copay. 100% paid by insurer"),
        _buildHighlightItem("Room rent limit"),
        _buildHighlightItem("Alternate medicine (AYUSH) covered upto SI"),
        _buildHighlightItem("Cover for organ transplant upto SI"),
        _buildHighlightItem("Air Ambulance covered upto 2.5 lakhs"),
        _buildHighlightItem("Unlimited e-consultations"),
        _buildHighlightItem(
          "Renewal discount rewarding active and healthy lifestyle",
        ),
        SizedBox(height: 20),
        Text(
          "Not Covered",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        _buildNotCoveredItem("World wide coverage"),
        _buildNotCoveredItem("Maternity cover"),
        _buildNotCoveredItem("Animal bite vaccination"),
        SizedBox(height: 20),
        Text(
          "Waiting Period",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        _buildWaitingPeriodItem("Accidents", "Immediate"),
        _buildWaitingPeriodItem("Hospitalisation claims", "30 days"),
        _buildWaitingPeriodItem("Specific Illness cover", "2 years"),
        _buildWaitingPeriodItem("Pre-existing diseases", "3 years"),
      ],
    );
  }

  Widget _buildHospitalsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.green, size: 20),
            SizedBox(width: 8),
            Text(
              "85 Cashless hospitals near you",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 12),
        GestureDetector(
          onTap: () => _showHospitalBottomSheet(context),
          child: Text(
            "View all",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHighlightItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 4, right: 12),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: Colors.white, size: 12),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotCoveredItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 4, right: 12),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.close, color: Colors.white, size: 12),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaitingPeriodItem(String condition, String period) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            condition,
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
          Text(
            period,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget tabContent;
    if (_selectedTabIndex == 0) {
      tabContent = _buildRidersContent();
    } else if (_selectedTabIndex == 1) {
      tabContent = _buildHighlightsContent();
    } else {
      tabContent = _buildHospitalsContent();
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 6)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                _buildTabButton("Riders", 0),
                _buildTabButton("Highlights", 1),
                _buildTabButton("Hospitals", 2),
              ],
            ),
          ),
          GestureDetector(
            onPanUpdate: (details) {
              if (details.delta.dx < -10 && _selectedTabIndex < 2) {
                _tabController.animateTo(_selectedTabIndex + 1);
              } else if (details.delta.dx > 10 && _selectedTabIndex > 0) {
                _tabController.animateTo(_selectedTabIndex - 1);
              }
            },
            child: AnimatedSize(
              duration: Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: tabContent,
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
