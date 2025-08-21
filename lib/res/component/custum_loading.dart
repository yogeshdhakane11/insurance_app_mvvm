// import 'package:flutter/material.dart';
//
// class CustomLoadingIndicator extends StatelessWidget {
//   final String message;
//   final Color backgroundColor;
//
//   const CustomLoadingIndicator({
//     Key? key,
//     this.message = "Loading...",
//     this.backgroundColor = Colors.white,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: backgroundColor.withOpacity(0.7),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircularProgressIndicator(),
//             SizedBox(height: 10),
//             Text(message, style: TextStyle(fontSize: 18, color: Colors.black)),
//           ],
//         ),
//       ),
//     );
//   }
// }
