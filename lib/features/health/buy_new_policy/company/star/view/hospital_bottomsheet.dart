import 'package:flutter/material.dart';

class _HospitalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final hospitals = [
      {
        "name": "AHMEDNAGAR APEX MULTISPECIALITY HOSPITAL",
        "address":
            "Nagar-Manmad Raodnear Parichay Hotel Savedi, Ahmed nagar - 414003",
      },
      {
        "name": "AKSHAY CHILDRENS HOSPITAL AND MATERNITY HOME",
        "address":
            "Near Cosmic Housing Societyball Kashram Road, Ahmed nagar - 414001",
      },
      {
        "name": "Aarogyam Agrawal Hospital",
        "address":
            "Near Swami Samarth Mandirsavedi Roadahmednagar, Ahmed nagar - 414003",
      },
      {
        "name": "Akolkar Hospital",
        "address": "Near I.T.I College Burudgaon Road, Ahmed nagar - 414001",
      },
      {
        "name": "BADE MULTISPECIALITY HOSPITAL",
        "address": "Station Road, Ahmed nagar - 414001",
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Hospitals",
                  style: TextStyle(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search hospital name",
                prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "85 hospitals in Ahmed nagar",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          ...hospitals.map(
            (h) => Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.015),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    h["name"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    h["address"]!,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class _HospitalBottomSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final hospitals = [
//       {
//         "name": "AHMEDNAGAR APEX MULTISPECIALITY HOSPITAL",
//         "address":
//             "Nagar-Manmad Raodnear Parichay Hotel Savedi, Ahmed nagar - 414003",
//       },
//       {
//         "name": "AKSHAY CHILDRENS HOSPITAL AND MATERNITY HOME",
//         "address":
//             "Near Cosmic Housing Societyball Kashram Road, Ahmed nagar - 414001",
//       },
//       {
//         "name": "Aarogyam Agrawal Hospital",
//         "address":
//             "Near Swami Samarth Mandirsavedi Roadahmednagar, Ahmed nagar - 414003",
//       },
//       {
//         "name": "Akolkar Hospital",
//         "address": "Near I.T.I College Burudgaon Road, Ahmed nagar - 414001",
//       },
//       {
//         "name": "BADE MULTISPECIALITY HOSPITAL",
//         "address": "Station Road, Ahmed nagar - 414001",
//       },
//     ];
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   "Hospitals",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               IconButton(
//                 icon: Icon(Icons.close),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ],
//           ),
//           Container(
//             margin: EdgeInsets.only(bottom: 14),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Search hospital name",
//                 prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 contentPadding: EdgeInsets.symmetric(vertical: 0),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               "85 hospitals in Ahmed nagar",
//               style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
//             ),
//           ),
//           SizedBox(height: 14),
//           ...hospitals.map(
//             (h) => Padding(
//               padding: const EdgeInsets.only(bottom: 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     h["name"]!,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                   SizedBox(height: 2),
//                   Text(
//                     h["address"]!,
//                     style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
