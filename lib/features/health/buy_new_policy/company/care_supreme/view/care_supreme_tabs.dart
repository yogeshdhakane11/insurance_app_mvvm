import 'package:flutter/material.dart';

class CareSupremeTabViewModel extends ChangeNotifier {
  int selectedTab = 0;
  bool rider1 = false;
  bool rider2 = false;
  bool rider3 = false;
  bool rider4 = false;
  bool rider5 = false;
  bool rider6 = false;
  bool rider7 = false;

  void selectTab(int i) {
    selectedTab = i;
    notifyListeners();
  }

  void toggleRider1() {
    rider1 = !rider1;
    notifyListeners();
  }

  void toggleRider2() {
    rider2 = !rider2;
    notifyListeners();
  }

  void toggleRider3() {
    rider1 = !rider3;
    notifyListeners();
  }

  void toggleRider4() {
    rider1 = !rider4;
    notifyListeners();
  }

  void toggleRider5() {
    rider1 = !rider5;
    notifyListeners();
  }

  void toggleRider6() {
    rider1 = !rider6;
    notifyListeners();
  }

  void toggleRider7() {
    rider1 = !rider7;
    notifyListeners();
  }
}

class CareSupremeTabWidget extends StatelessWidget {
  final VoidCallback? onShowAllHospitals;
  const CareSupremeTabWidget({super.key, this.onShowAllHospitals});

  @override
  Widget build(BuildContext context) {
    return _CareSupremeFlexibleTabContent(
      onShowAllHospitals: onShowAllHospitals,
    );
  }
}

class _CareSupremeFlexibleTabContent extends StatefulWidget {
  final VoidCallback? onShowAllHospitals;
  const _CareSupremeFlexibleTabContent({this.onShowAllHospitals});

  @override
  State<_CareSupremeFlexibleTabContent> createState() =>
      _CareSupremeFlexibleTabContentState();
}

class _CareSupremeFlexibleTabContentState
    extends State<_CareSupremeFlexibleTabContent>
    with TickerProviderStateMixin {
  late CareSupremeTabViewModel vm;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    vm = CareSupremeTabViewModel();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(() {
      if (_tabController.index != vm.selectedTab) {
        setState(() {
          vm.selectedTab = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleHorizontalDrag(DragUpdateDetails details) {
    if (details.primaryDelta == null) return;
    if (details.primaryDelta! < -10 && vm.selectedTab < 2) {
      _tabController.animateTo(vm.selectedTab + 1);
    } else if (details.primaryDelta! > 10 && vm.selectedTab > 0) {
      _tabController.animateTo(vm.selectedTab - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = [
      _ridersTab(context),
      _highlightsTab(),
      _hospitalsTab(context),
    ][vm.selectedTab];

    return AnimatedSize(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFFF6F7FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  _tabButton("Riders", 0),
                  _tabButton("Highlights", 1),
                  _tabButton("Hospitals", 2),
                ],
              ),
            ),
            GestureDetector(
              onPanUpdate: _handleHorizontalDrag,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: content,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _tabButton(String title, int idx) {
    final selected = vm.selectedTab == idx;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _tabController.animateTo(idx);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: selected
                ? [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)]
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: selected ? Color(0xFF3366CC) : Color(0xFF8C98A8),
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ridersTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Riders are additional benefits which you can opt for along with your current health insurance policy at affordable rates.",
          style: TextStyle(fontSize: 14, color: Color(0xFF7D8FAB)),
        ),
        SizedBox(height: 20),
        // Pre-included benefits section
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            title: Text(
              "CB Super, Air Ambulance, Wellness Benefit",
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
            subtitle: Text(
              "These benefits are pre-included in this plan.",
              // style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ),
        ),
        SizedBox(height: 11),
        Text(
          "Add Riders",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 12),
        // Rider 1
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            value: vm.rider1,
            onChanged: (_) => setState(() => vm.toggleRider1()),
            title: Text.rich(
              TextSpan(
                text: "Annual Health Check-up ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3366CC),
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: "(+₹453)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3366CC),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "Free for all the insured members once a year.",
              style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Color(0xFF3366CC),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Rider 2
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            value: vm.rider2,
            onChanged: (_) => setState(() => vm.toggleRider2()),
            title: Text.rich(
              TextSpan(
                text: "Instant Cover ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3366CC),
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: "(+₹1,876)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3366CC),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "Claims can be made for Diabetes, Hypertension, Hyperlipidemia & Asthma after initial period of 30 days.",
              style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Color(0xFF3366CC),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Rider 3
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            value: vm.rider3,
            onChanged: (_) => setState(() => vm.toggleRider3()),
            title: Text.rich(
              TextSpan(
                text: "Claim Shield ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3366CC),
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: "(+₹588)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3366CC),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "Get claim for expenses incurred on 68 Non-Payable items as per list of items in policy T&C.",
              style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Color(0xFF3366CC),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Rider 4
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            value: vm.rider4,
            onChanged: (_) => setState(() => vm.toggleRider4()),
            title: Text.rich(
              TextSpan(
                text: "Be-Fit Benefit ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3366CC),
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: "(+₹727)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3366CC),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "Unlimited visits to Fitness centres can be availed by Insured members aged above 12 years.",
              style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Color(0xFF3366CC),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Rider 5
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            value: vm.rider5,
            onChanged: (_) => setState(() => vm.toggleRider5()),
            title: Text.rich(
              TextSpan(
                text: "Care OPD ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3366CC),
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: "(+₹682)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3366CC),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "Get covered for 4 consultations per year up to ₹500 per consultation.",
              style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Color(0xFF3366CC),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Rider 6
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            value: vm.rider6,
            onChanged: (_) => setState(() => vm.toggleRider6()),
            title: Text.rich(
              TextSpan(
                text: "Unlimited Care ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3366CC),
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: "(+₹1,500)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3366CC),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "Get eligible for a one-time unlimited claim without any upper limit during the policy's lifetime.",
              style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Color(0xFF3366CC),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // Rider 7
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            value: vm.rider7,
            onChanged: (_) => setState(() => vm.toggleRider7()),
            title: Text.rich(
              TextSpan(
                text: "Reduction in PED Wait Period ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3366CC),
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: "(+₹444)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3366CC),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(
              "PED waiting period will be reduced to 1/2 years from 3 years.",
              style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Color(0xFF3366CC),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _highlightsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Covered",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        _highlightItem("Get 7x sum insured in 5 years", true),
        _highlightItem(
          "No Sublimit on Modern Treatment, AYUSH, Room rent",
          true,
        ),
        _highlightItem("Unlimited restoration of sum insured", true),
        _highlightItem(
          "Avail Cumulative Bonus up to 100% SI per year and max up to 500%",
          true,
        ),
        _highlightItem(
          "Renewal discount rewarding active and healthy lifestyle",
          true,
        ),
        _highlightItem("Air Ambulance with limit upto SI", true),
        _highlightItem("Unlimited E-consultation with Doctors", true),
        _highlightItem("At home treatment covered upto SI", true),
        _highlightItem("Day care treatment covered upto SI", true),
        _highlightItem("0% Copay. Insurer pays 100%", true),
        _highlightItem("Ambulance charges up to 10000 covered", true),
        _highlightItem("Cover for organ transplant upto SI", true),
        SizedBox(height: 16),
        Text(
          "Not Covered",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        _highlightItem("World wide coverage", false),
        _highlightItem("Daily cash allowance", false),
        _highlightItem("Animal bite vaccination", false),
        _highlightItem("Out patient consultation benefits", false),
        _highlightItem("Maternity", false),
        SizedBox(height: 16),
        Text(
          "Waiting Period",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        _waitingPeriodRow("Accidents", "Immediate"),
        _waitingPeriodRow("Hospitalisation claims", "30 days"),
        _waitingPeriodRow("Named Ailment", "2 years"),
        _waitingPeriodRow("Pre-existing diseases", "3 years"),
      ],
    );
  }

  Widget _highlightItem(String label, bool covered) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(
            covered ? Icons.check_circle : Icons.cancel,
            color: covered ? Color(0xFF33CC66) : Color(0xFFFF5C5C),
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: covered ? Color(0xFF112244) : Color(0xFFDE2E2E),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _waitingPeriodRow(String left, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              left,
              style: TextStyle(fontSize: 15, color: Color(0xFF7D8FAB)),
            ),
          ),
          SizedBox(width: 10),
          Text(right, style: TextStyle(fontSize: 15, color: Color(0xFF112244))),
        ],
      ),
    );
  }

  Widget _hospitalsTab(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.local_hospital, color: Color(0xFFFF6F61), size: 22),
            SizedBox(width: 8),
            Text(
              "7800+ Cashless Hospitals in India",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        ...[
          {
            "name": "Apollo Children",
            "address": "No.15, Shafi Mohammed Road, Chennai - 600006",
          },
          {
            "name": "Apollo First Med Hospitals-Kilpauk",
            "address": "No.154, Chennai - 600010",
          },
          {
            "name": "Kkr Ent Hospital And Research Institute Pvt. Ltd.",
            "address": "No.274, Poonamalla High Road, Chennai - 600010",
          },
        ].map(
          (h) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  h["name"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 2),
                Text(
                  h["address"]!,
                  style: TextStyle(fontSize: 14, color: Color(0xFF7D8FAB)),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: widget.onShowAllHospitals,
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
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
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
//
// class CareSupremeTabViewModel extends ChangeNotifier {
//   int selectedTab = 0;
//   bool rider1 = false;
//   bool rider2 = false;
//   bool rider3 = false;
//   bool rider4 = false;
//   bool rider5 = false;
//   bool rider6 = false;
//   bool rider7 = false;
//
//   void selectTab(int i) {
//     selectedTab = i;
//     notifyListeners();
//   }
//
//   void toggleRider1() {
//     rider1 = !rider1;
//     notifyListeners();
//   }
//
//   void toggleRider2() {
//     rider2 = !rider2;
//     notifyListeners();
//   }
//
//   void toggleRider3() {
//     rider1 = !rider3;
//     notifyListeners();
//   }
//
//   void toggleRider4() {
//     rider1 = !rider4;
//     notifyListeners();
//   }
//
//   void toggleRider5() {
//     rider1 = !rider5;
//     notifyListeners();
//   }
//
//   void toggleRider6() {
//     rider1 = !rider6;
//     notifyListeners();
//   }
//
//   void toggleRider7() {
//     rider1 = !rider7;
//     notifyListeners();
//   }
// }
//
// class CareSupremeTabWidget extends StatelessWidget {
//   final VoidCallback? onShowAllHospitals;
//   const CareSupremeTabWidget({super.key, this.onShowAllHospitals});
//
//   @override
//   Widget build(BuildContext context) {
//     return _CareSupremeFlexibleTabContent(
//       onShowAllHospitals: onShowAllHospitals,
//     );
//   }
// }
//
// class _CareSupremeFlexibleTabContent extends StatefulWidget {
//   final VoidCallback? onShowAllHospitals;
//   const _CareSupremeFlexibleTabContent({this.onShowAllHospitals});
//
//   @override
//   State<_CareSupremeFlexibleTabContent> createState() =>
//       _CareSupremeFlexibleTabContentState();
// }
//
// class _CareSupremeFlexibleTabContentState
//     extends State<_CareSupremeFlexibleTabContent>
//     with TickerProviderStateMixin {
//   late CareSupremeTabViewModel vm;
//   late TabController _tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     vm = CareSupremeTabViewModel();
//     _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
//     _tabController.addListener(() {
//       if (_tabController.index != vm.selectedTab) {
//         setState(() {
//           vm.selectedTab = _tabController.index;
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   void _handleHorizontalDrag(DragUpdateDetails details) {
//     if (details.primaryDelta == null) return;
//     if (details.primaryDelta! < -10 && vm.selectedTab < 2) {
//       _tabController.animateTo(vm.selectedTab + 1);
//     } else if (details.primaryDelta! > 10 && vm.selectedTab > 0) {
//       _tabController.animateTo(vm.selectedTab - 1);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget content = [
//       _ridersTab(context),
//       _highlightsTab(),
//       _hospitalsTab(context),
//     ][vm.selectedTab];
//
//     return AnimatedSize(
//       duration: Duration(milliseconds: 250),
//       curve: Curves.easeInOut,
//       alignment: Alignment.topCenter,
//       child: Container(
//         margin: const EdgeInsets.only(bottom: 18),
//         padding: const EdgeInsets.all(0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               margin: const EdgeInsets.all(14),
//               decoration: BoxDecoration(
//                 color: Color(0xFFF6F7FB),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 children: [
//                   _tabButton("Riders", 0),
//                   _tabButton("Highlights", 1),
//                   _tabButton("Hospitals", 2),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onPanUpdate: _handleHorizontalDrag,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 18),
//                 child: content,
//               ),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _tabButton(String title, int idx) {
//     final selected = vm.selectedTab == idx;
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           _tabController.animateTo(idx);
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 13),
//           decoration: BoxDecoration(
//             color: selected ? Colors.white : Colors.transparent,
//             borderRadius: BorderRadius.circular(8),
//             boxShadow: selected
//                 ? [BoxShadow(color: Colors.grey.shade200, blurRadius: 2)]
//                 : null,
//           ),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyle(
//                 color: selected ? Color(0xFF3366CC) : Color(0xFF8C98A8),
//                 fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _ridersTab(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Riders are additional benefits which you can opt for along with your current health insurance policy at affordable rates.",
//           style: TextStyle(fontSize: 14, color: Color(0xFF7D8FAB)),
//         ),
//         SizedBox(height: 20),
//         // Pre-included benefits section
//         Container(
//           margin: EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.green.shade50,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: ListTile(
//             title: Text(
//               "CB Super, Air Ambulance, Wellness Benefit",
//               style: TextStyle(color: Colors.green, fontSize: 15),
//             ),
//             subtitle: Text(
//               "These benefits are pre-included in this plan.",
//               // style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
//               style: TextStyle(color: Colors.green, fontSize: 15),
//             ),
//           ),
//         ),
//         SizedBox(height: 11),
//         Text(
//           "Add Riders",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         SizedBox(height: 12),
//         // Rider 1
//         Container(
//           margin: EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: CheckboxListTile(
//             value: vm.rider1,
//             onChanged: (_) => setState(() => vm.toggleRider1()),
//             title: Text.rich(
//               TextSpan(
//                 text: "Annual Health Check-up ",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF3366CC),
//                   fontSize: 15,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: "(+₹453)",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF3366CC),
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             subtitle: Text(
//               "Free for all the insured members once a year.",
//               style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
//             ),
//             controlAffinity: ListTileControlAffinity.trailing,
//             activeColor: Color(0xFF3366CC),
//             contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//         // Rider 2
//         Container(
//           margin: EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: CheckboxListTile(
//             value: vm.rider2,
//             onChanged: (_) => setState(() => vm.toggleRider2()),
//             title: Text.rich(
//               TextSpan(
//                 text: "Instant Cover ",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF3366CC),
//                   fontSize: 15,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: "(+₹1,876)",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF3366CC),
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             subtitle: Text(
//               "Claims can be made for Diabetes, Hypertension, Hyperlipidemia & Asthma after initial period of 30 days.",
//               style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
//             ),
//             controlAffinity: ListTileControlAffinity.trailing,
//             activeColor: Color(0xFF3366CC),
//             contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//         // Rider 3
//         Container(
//           margin: EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: CheckboxListTile(
//             value: vm.rider3,
//             onChanged: (_) => setState(() => vm.toggleRider3()),
//             title: Text.rich(
//               TextSpan(
//                 text: "Claim Shield ",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF3366CC),
//                   fontSize: 15,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: "(+₹588)",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF3366CC),
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             subtitle: Text(
//               "Get claim for expenses incurred on 68 Non-Payable items as per list of items in policy T&C.",
//               style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
//             ),
//             controlAffinity: ListTileControlAffinity.trailing,
//             activeColor: Color(0xFF3366CC),
//             contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//         // Rider 4
//         Container(
//           margin: EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: CheckboxListTile(
//             value: vm.rider4,
//             onChanged: (_) => setState(() => vm.toggleRider4()),
//             title: Text.rich(
//               TextSpan(
//                 text: "Be-Fit Benefit ",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF3366CC),
//                   fontSize: 15,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: "(+₹727)",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF3366CC),
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             subtitle: Text(
//               "Unlimited visits to Fitness centres can be availed by Insured members aged above 12 years.",
//               style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
//             ),
//             controlAffinity: ListTileControlAffinity.trailing,
//             activeColor: Color(0xFF3366CC),
//             contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//         // Rider 5
//         Container(
//           margin: EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: CheckboxListTile(
//             value: vm.rider5,
//             onChanged: (_) => setState(() => vm.toggleRider5()),
//             title: Text.rich(
//               TextSpan(
//                 text: "Care OPD ",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF3366CC),
//                   fontSize: 15,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: "(+₹682)",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF3366CC),
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             subtitle: Text(
//               "Get covered for 4 consultations per year up to ₹500 per consultation.",
//               style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
//             ),
//             controlAffinity: ListTileControlAffinity.trailing,
//             activeColor: Color(0xFF3366CC),
//             contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//         // Rider 6
//         Container(
//           margin: EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: CheckboxListTile(
//             value: vm.rider6,
//             onChanged: (_) => setState(() => vm.toggleRider6()),
//             title: Text.rich(
//               TextSpan(
//                 text: "Unlimited Care ",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF3366CC),
//                   fontSize: 15,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: "(+₹1,500)",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF3366CC),
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             subtitle: Text(
//               "Get eligible for a one-time unlimited claim without any upper limit during the policy's lifetime.",
//               style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
//             ),
//             controlAffinity: ListTileControlAffinity.trailing,
//             activeColor: Color(0xFF3366CC),
//             contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//         // Rider 7
//         Container(
//           margin: EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.blue.shade50,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: CheckboxListTile(
//             value: vm.rider7,
//             onChanged: (_) => setState(() => vm.toggleRider7()),
//             title: Text.rich(
//               TextSpan(
//                 text: "Reduction in PED Wait Period ",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF3366CC),
//                   fontSize: 15,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: "(+₹444)",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       color: Color(0xFF3366CC),
//                       fontSize: 15,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             subtitle: Text(
//               "PED waiting period will be reduced to 1/2 years from 3 years.",
//               style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
//             ),
//             controlAffinity: ListTileControlAffinity.trailing,
//             activeColor: Color(0xFF3366CC),
//             contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _highlightsTab() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Covered",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         SizedBox(height: 8),
//         _highlightItem("Get 7x sum insured in 5 years", true),
//         _highlightItem(
//           "No Sublimit on Modern Treatment, AYUSH, Room rent",
//           true,
//         ),
//         _highlightItem("Unlimited restoration of sum insured", true),
//         _highlightItem(
//           "Avail Cumulative Bonus up to 100% SI per year and max up to 500%",
//           true,
//         ),
//         _highlightItem(
//           "Renewal discount rewarding active and healthy lifestyle",
//           true,
//         ),
//         _highlightItem("Air Ambulance with limit upto SI", true),
//         _highlightItem("Unlimited E-consultation with Doctors", true),
//         _highlightItem("At home treatment covered upto SI", true),
//         _highlightItem("Day care treatment covered upto SI", true),
//         _highlightItem("0% Copay. Insurer pays 100%", true),
//         _highlightItem("Ambulance charges up to 10000 covered", true),
//         _highlightItem("Cover for organ transplant upto SI", true),
//         SizedBox(height: 16),
//         Text(
//           "Not Covered",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         SizedBox(height: 8),
//         _highlightItem("World wide coverage", false),
//         _highlightItem("Daily cash allowance", false),
//         _highlightItem("Animal bite vaccination", false),
//         _highlightItem("Out patient consultation benefits", false),
//         _highlightItem("Maternity", false),
//         SizedBox(height: 16),
//         Text(
//           "Waiting Period",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//         SizedBox(height: 8),
//         _waitingPeriodRow("Accidents", "Immediate"),
//         _waitingPeriodRow("Hospitalisation claims", "30 days"),
//         _waitingPeriodRow("Named Ailment", "2 years"),
//         _waitingPeriodRow("Pre-existing diseases", "3 years"),
//       ],
//     );
//   }
//
//   Widget _highlightItem(String label, bool covered) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 3),
//       child: Row(
//         children: [
//           Icon(
//             covered ? Icons.check_circle : Icons.cancel,
//             color: covered ? Color(0xFF33CC66) : Color(0xFFFF5C5C),
//             size: 20,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               label,
//               style: TextStyle(
//                 fontSize: 15,
//                 color: covered ? Color(0xFF112244) : Color(0xFFDE2E2E),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _waitingPeriodRow(String left, String right) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Text(
//               left,
//               style: TextStyle(fontSize: 15, color: Color(0xFF7D8FAB)),
//             ),
//           ),
//           SizedBox(width: 10),
//           Text(right, style: TextStyle(fontSize: 15, color: Color(0xFF112244))),
//         ],
//       ),
//     );
//   }
//
//   Widget _hospitalsTab(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             Icon(Icons.local_hospital, color: Color(0xFFFF6F61), size: 22),
//             SizedBox(width: 8),
//             Text(
//               "7800+ Cashless Hospitals in India",
//               style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 15,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 16),
//         ...[
//           {
//             "name": "Apollo Children",
//             "address": "No.15, Shafi Mohammed Road, Chennai - 600006",
//           },
//           {
//             "name": "Apollo First Med Hospitals-Kilpauk",
//             "address": "No.154, Chennai - 600010",
//           },
//           {
//             "name": "Kkr Ent Hospital And Research Institute Pvt. Ltd.",
//             "address": "No.274, Poonamalla High Road, Chennai - 600010",
//           },
//         ].map(
//           (h) => Padding(
//             padding: const EdgeInsets.only(bottom: 12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   h["name"]!,
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(height: 2),
//                 Text(
//                   h["address"]!,
//                   style: TextStyle(fontSize: 14, color: Color(0xFF7D8FAB)),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: widget.onShowAllHospitals,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 6),
//             child: Text(
//               "View all",
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 14,
//                 decoration: TextDecoration.underline,
//                 decorationColor: Colors.blue,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
