import 'package:flutter/material.dart';

class MyPolicyCard extends StatelessWidget {
  final String title;
  final String planName;
  final String validFrom;
  final String validTill;

  const MyPolicyCard({
    super.key,
    required this.title,
    required this.planName,
    required this.validFrom,
    required this.validTill,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final gradientColors = _getGradient(title);

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02), // Responsive margin
      padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(colors: gradientColors),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '$title Card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: screenHeight * 0.01,
                ), // Responsive padding
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "External Policy",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01), // Responsive spacing
          Text(
            "PLAN NAME\n$planName",
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.045, // Responsive font size
            ),
          ),
          SizedBox(height: screenHeight * 0.01), // Responsive spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "VALID FROM\n$validFrom",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04, // Responsive font size
                ),
              ),
              Text(
                "VALID TILL\n$validTill",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.04, // Responsive font size
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Color> _getGradient(String type) {
    switch (type.toLowerCase()) {
      case 'motor':
        return [Colors.pinkAccent, Colors.pink];
      case 'health':
        return [Colors.greenAccent.shade200, Colors.green];
      case 'insurance':
        return [Colors.lightBlueAccent, Colors.blue];
      case 'term':
        return [Colors.orangeAccent, Colors.orange];
      default:
        return [Colors.grey.shade300, Colors.grey];
    }
  }
}

// import 'package:flutter/material.dart';
//
// class CardWidget extends StatelessWidget {
//   final String title;
//   final String planName;
//   final String validFrom;
//   final String validTill;
//
//   const CardWidget({
//     super.key,
//     required this.title,
//     required this.planName,
//     required this.validFrom,
//     required this.validTill,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final gradientColors = _getGradient(title);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         gradient: LinearGradient(colors: gradientColors),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Text(
//                 '$title Card',
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.4),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: const Text(
//                   "External Policy",
//                   style: TextStyle(color: Colors.white, fontSize: 12),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Text(
//             "PLAN NAME\n$planName",
//             style: const TextStyle(color: Colors.white, fontSize: 14),
//           ),
//           const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "VALID FROM\n$validFrom",
//                 style: const TextStyle(color: Colors.white),
//               ),
//               Text(
//                 "VALID TILL\n$validTill",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   List<Color> _getGradient(String type) {
//     switch (type.toLowerCase()) {
//       case 'motor':
//         return [Colors.pinkAccent, Colors.pink];
//       case 'health':
//         return [Colors.greenAccent.shade200, Colors.green];
//       case 'insurance':
//         return [Colors.lightBlueAccent, Colors.blue];
//       case 'term':
//         return [Colors.orangeAccent, Colors.orange];
//       default:
//         return [Colors.grey.shade300, Colors.grey];
//     }
//   }
// }
