import 'package:flutter/material.dart';

class HospitalBottomSheet extends StatefulWidget {
  @override
  _HospitalBottomSheetState createState() => _HospitalBottomSheetState();
}

class _HospitalBottomSheetState extends State<HospitalBottomSheet> {
  // Sample list of hospitals
  final List<String> hospitals = [
    'Apollo Children',
    'Apollo First Med Hospitals-Kilpauk',
    'KKR ENT Hospital And Research Institute Pvt. Ltd.',
    'Hande Hospital',
    'Sri Balaji Hospital',
    'Apollo Specialty Hospitals-Teynampet',
  ];

  String selectedCity = 'Chennai';
  List<String> filteredHospitals = [];

  @override
  void initState() {
    super.initState();
    filteredHospitals = hospitals; // initially showing all hospitals
  }

  void filterHospitals(String city) {
    setState(() {
      selectedCity = city;
      // Simple filtering logic based on city selection
      filteredHospitals = hospitals.where((hospital) {
        return hospital.contains('Apollo') &&
            city == 'Chennai'; // Filter Example
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // City Dropdown
          Container(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.0125),
            child: DropdownButton<String>(
              value: selectedCity,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  filterHospitals(newValue);
                }
              },
              items:
                  <String>[
                    'Chennai',
                    'Chengalpattu',
                    'Chengannur',
                    'Cherupallur',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      ),
                    );
                  }).toList(),
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.black,
              ),
              isExpanded: true,
              underline: Container(height: 1, color: Colors.grey.shade300),
            ),
          ),

          // Search Bar for hospitals
          TextField(
            decoration: InputDecoration(
              labelText: 'Search hospital name',
              labelStyle: TextStyle(fontSize: screenWidth * 0.035),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
            ),
            style: TextStyle(fontSize: screenWidth * 0.04),
            onChanged: (query) {
              setState(() {
                filteredHospitals = hospitals
                    .where(
                      (hospital) =>
                          hospital.toLowerCase().contains(query.toLowerCase()),
                    )
                    .toList();
              });
            },
          ),

          // List of filtered hospitals
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredHospitals.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    filteredHospitals[index],
                    style: TextStyle(fontSize: screenWidth * 0.04),
                  ),
                  subtitle: Text(
                    'No. ${index + 1} - Example Address',
                    style: TextStyle(fontSize: screenWidth * 0.035),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HospitalSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customize your Plan',
          style: TextStyle(fontSize: screenWidth * 0.045),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(screenWidth * 0.05),
                ),
              ),
              builder: (_) => HospitalBottomSheet(),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1,
              vertical: screenWidth * 0.035,
            ),
            textStyle: TextStyle(fontSize: screenWidth * 0.04),
          ),
          child: Text('Select Hospital'),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class HospitalBottomSheet extends StatefulWidget {
//   @override
//   _HospitalBottomSheetState createState() => _HospitalBottomSheetState();
// }
//
// class _HospitalBottomSheetState extends State<HospitalBottomSheet> {
//   // Sample list of hospitals
//   final List<String> hospitals = [
//     'Apollo Children',
//     'Apollo First Med Hospitals-Kilpauk',
//     'KKR ENT Hospital And Research Institute Pvt. Ltd.',
//     'Hande Hospital',
//     'Sri Balaji Hospital',
//     'Apollo Specialty Hospitals-Teynampet',
//   ];
//
//   String selectedCity = 'Chennai';
//   List<String> filteredHospitals = [];
//
//   @override
//   void initState() {
//     super.initState();
//     filteredHospitals = hospitals; // initially showing all hospitals
//   }
//
//   void filterHospitals(String city) {
//     setState(() {
//       selectedCity = city;
//       // Simple filtering logic based on city selection
//       filteredHospitals = hospitals.where((hospital) {
//         return hospital.contains('Apollo') && city == 'Chennai'; // Filter Example
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // City Dropdown
//           Container(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: DropdownButton<String>(
//               value: selectedCity,
//               onChanged: (String? newValue) {
//                 if (newValue != null) {
//                   filterHospitals(newValue);
//                 }
//               },
//               items: <String>['Chennai', 'Chengalpattu', 'Chengannur', 'Cherupallur']
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//
//           // Search Bar for hospitals
//           TextField(
//             decoration: InputDecoration(
//               labelText: 'Search hospital name',
//               border: OutlineInputBorder(),
//             ),
//             onChanged: (query) {
//               setState(() {
//                 filteredHospitals = hospitals
//                     .where((hospital) => hospital.toLowerCase().contains(query.toLowerCase()))
//                     .toList();
//               });
//             },
//           ),
//
//           // List of filtered hospitals
//           Expanded(
//             child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: filteredHospitals.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(filteredHospitals[index]),
//                   subtitle: Text('No. ${index + 1} - Example Address'), // Example Address
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class HospitalSelectionScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Customize your Plan')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showModalBottomSheet(
//               context: context,
//               isScrollControlled: true,
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//               ),
//               builder: (_) => HospitalBottomSheet(),
//             );
//           },
//           child: Text('Select Hospital'),
//         ),
//       ),
//     );
//   }
// }
//
