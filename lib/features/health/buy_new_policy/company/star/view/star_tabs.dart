import 'package:flutter/material.dart';

class StarTabViewModel extends ChangeNotifier {
  int selectedTab = 0;
  bool rider1 = false;
  bool rider2 = false;

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
}

class StarFlexibleTabWidget extends StatelessWidget {
  final VoidCallback? onShowAllHospitals;
  const StarFlexibleTabWidget({super.key, this.onShowAllHospitals});

  @override
  Widget build(BuildContext context) {
    return _StarFlexibleTabContent(onShowAllHospitals: onShowAllHospitals);
  }
}

class _StarFlexibleTabContent extends StatefulWidget {
  final VoidCallback? onShowAllHospitals;
  const _StarFlexibleTabContent({this.onShowAllHospitals});

  @override
  State<_StarFlexibleTabContent> createState() =>
      _StarFlexibleTabContentState();
}

class _StarFlexibleTabContentState extends State<_StarFlexibleTabContent>
    with TickerProviderStateMixin {
  late StarTabViewModel vm;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    vm = StarTabViewModel();
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
        Text(
          "Add Riders",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 12),
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            // color: Color(0xFFF6F7FB),
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            value: vm.rider1,
            onChanged: (_) => setState(() => vm.toggleRider1()),
            title: Text.rich(
              TextSpan(
                text: "Star Extra Protect ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3366CC),
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: "(+₹1,858)",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF3366CC),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "- Enhanced Room Rent",
                  style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
                ),
                Text(
                  "- Claim Guard",
                  style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
                ),
                Text(
                  "- Enhanced Limit for Modern Treatment",
                  style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
                ),
              ],
            ),
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: Color(0xFF3366CC),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            // color: Color(0xFFF6F7FB),
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: CheckboxListTile(
            value: vm.rider2,
            onChanged: (_) => setState(() => vm.toggleRider2()),
            title: Text.rich(
              TextSpan(
                text: "PED BuyBack ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3366CC),
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: "(+₹2,479)",
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
              "This is an add-on when approved will reduce the waiting period to 1 year. The customer will have to pay an additional premium",
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
        _highlightItem("Personal Accident Cover", true),
        _highlightItem("Single Private AC Room", true),
        _highlightItem("No claim bonus", true),
        _highlightItem("Restoration of Cover", true),
        _highlightItem("Hospitalization at home", true),
        _highlightItem("Ambulance Charges", true),
        _highlightItem("Health Check-up", true),
        SizedBox(height: 16),
        Text(
          "Not Covered",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        _highlightItem("World wide coverage", false),
        _highlightItem("Animal bite vaccination", false),
        SizedBox(height: 16),
        Text(
          "Waiting Period",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        _waitingPeriodRow("Existing Illness cover", "3 Years"),
        _waitingPeriodRow("Maternity cover", "After 2 Years"),
        _waitingPeriodRow(
          "Initial Waiting Period",
          "\n 30 days except for\n covered accidents",
        ),
        _waitingPeriodRow("Specific Illness cover", "2 Years"),
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
              "14000+ Cashless Hospitals in India",
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
            "name":
                "Sri Kanchi Maha Swamy Eye Clinic (Dr. Uma Ramesh - Ophthalmologist)",
            "address": "Aminjikarai, CHENGALPATTU, Chennai - 600029",
          },
          {
            "name": "Halos Skin Clinic (Dr. Prasanthi - Dermatologist)",
            "address": "Aminjikarai, CHENGALPATTU, Chennai - 600029",
          },
          {
            "name": "Chordia Clinic (Dr. Mohnish Chordia - Diabetologist)",
            "address": "Park Town, CHENGALPATTU, Chennai - 600079",
          },
        ].map(
          (h) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  h["name"]!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(height: 2),
                Text(
                  h["address"]!,
                  style: TextStyle(fontSize: 13, color: Color(0xFF7D8FAB)),
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
