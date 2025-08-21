// import 'package:flutter/material.dart';
//
// class CustomBottomSheet extends StatelessWidget {
//   final String title;
//   final Widget content;
//
//   const CustomBottomSheet({Key? key, required this.title, required this.content})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15),
//           topRight: Radius.circular(15),
//         ),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           content,  // Pass dynamic content here
//         ],
//       ),
//     );
//   }
// }
//
