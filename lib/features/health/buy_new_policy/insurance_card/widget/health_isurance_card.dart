import 'package:flutter/material.dart';

class InsurancePlanCard extends StatelessWidget {
  final String logoPath;
  final String title;
  final String hospitalCount;
  final List<String> features;
  final String premium;
  final String sumInsured;
  final String claimSettled;
  final String? discountText;
  final Color? discountColor;
  final VoidCallback? onTap;

  const InsurancePlanCard({
    super.key,
    required this.logoPath,
    required this.title,
    required this.hospitalCount,
    required this.features,
    required this.premium,
    required this.sumInsured,
    required this.claimSettled,
    this.discountText,
    this.discountColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.02,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(11),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      logoPath.startsWith('http')
                          ? Image.network(
                              logoPath,
                              height: screenHeight * 0.025, // Adjust logo size
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.error, size: 18),
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return const SizedBox(
                                      height: 18,
                                      width: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    );
                                  },
                            )
                          : Image.asset(logoPath, height: screenHeight * 0.025),
                      SizedBox(width: screenWidth * 0.04), // Adjust spacing
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: screenWidth * 0.047, // Responsive font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              // Hospital count
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 16),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    hospitalCount,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                    ), // Responsive font size
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.011), // Responsive spacing
              // Features
              ...features.map(
                (f) => Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 16,
                    ),
                    SizedBox(width: screenWidth * 0.021), // Adjust spacing
                    Expanded(
                      child: Text(
                        f,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                        ), // Responsive font size
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.024), // Responsive spacing
              // Price & Claim
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹$premium / year",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$sumInsured",
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Wrap(
                spacing: screenWidth * 0.03, // Space between tags
                runSpacing:
                    screenHeight * 0.01, // Space between lines if wrapped
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenWidth * 0.03, // Responsive horizontal padding
                      vertical:
                          screenHeight * 0.01, // Responsive vertical padding
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      claimSettled,
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                      ), // Responsive font size
                    ),
                  ),
                  if (discountText != null)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            screenWidth * 0.03, // Responsive horizontal padding
                        vertical:
                            screenHeight * 0.01, // Responsive vertical padding
                      ),
                      decoration: BoxDecoration(
                        color: discountColor ?? Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        discountText!,
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                        ), // Responsive font size
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class InsurancePlanCard extends StatelessWidget {
//   final String logoPath;
//   final String title;
//   final String hospitalCount;
//   final List<String> features;
//   final String premium;
//   final String sumInsured;
//   final String claimSettled;
//   final String? discountText;
//   final Color? discountColor;
//   final VoidCallback? onTap;
//
//   const InsurancePlanCard({
//     super.key,
//     required this.logoPath,
//     required this.title,
//     required this.hospitalCount,
//     required this.features,
//     required this.premium,
//     required this.sumInsured,
//     required this.claimSettled,
//     this.discountText,
//     this.discountColor,
//     this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       // horizontal 16
//       color: Colors.white,
//       elevation: 0,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 1),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(11),
//         child: Padding(
//           padding: const EdgeInsets.all(11),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       logoPath.startsWith('http')
//                           ? Image.network(
//                               logoPath,
//                               height: 18,
//                               errorBuilder: (context, error, stackTrace) =>
//                                   const Icon(Icons.error, size: 18),
//                               loadingBuilder:
//                                   (context, child, loadingProgress) {
//                                     if (loadingProgress == null) return child;
//                                     return const SizedBox(
//                                       height: 18,
//                                       width: 18,
//                                       child: CircularProgressIndicator(
//                                         strokeWidth: 2,
//                                       ),
//                                     );
//                                   },
//                             )
//                           : Image.asset(logoPath, height: 18),
//                       const SizedBox(width: 7),
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Icon(Icons.arrow_forward_ios, size: 16),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               // Hospital count
//               Row(
//                 children: [
//                   const Icon(Icons.location_on_outlined, size: 16),
//                   const SizedBox(width: 4),
//                   Text(hospitalCount, style: const TextStyle(fontSize: 16)),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               // Features
//               ...features.map(
//                 (f) => Row(
//                   children: [
//                     const Icon(
//                       Icons.check_circle,
//                       color: Colors.green,
//                       size: 16,
//                     ),
//                     const SizedBox(width: 6),
//                     Expanded(
//                       child: Text(f, style: const TextStyle(fontSize: 16)),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               // Price & Claim
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "₹$premium / year",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     // "₹$sumInsured",
//                     "$sumInsured",
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 6),
//               Wrap(
//                 spacing: 8, // Space between tags
//                 runSpacing: 4, // Space between lines if wrapped
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.purple.shade50,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       claimSettled,
//                       style: const TextStyle(fontSize: 12),
//                     ),
//                   ),
//                   if (discountText != null)
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                         vertical: 4,
//                       ),
//                       decoration: BoxDecoration(
//                         color: discountColor ?? Colors.green.shade50,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         discountText!,
//                         style: const TextStyle(fontSize: 12),
//                       ),
//                     ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
