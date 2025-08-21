import 'package:flutter/material.dart';
import 'package:insurance/features/dashboard/screen/Insurance_Screen.dart';
import 'package:provider/provider.dart';
import '../../health/buy_new_policy/company/care_supreme/view/care_supreme_screen.dart';
import '../../health/buy_new_policy/company/care_supreme/view/self_screen.dart';
import '../../health/buy_new_policy/company/niva_bupa/view/complete_kyc.dart';
import '../../health/buy_new_policy/company/niva_bupa/view/niva_bupa_screen.dart';
import '../../health/buy_new_policy/company/niva_bupa/view/proposer_bottomsheet.dart';
import '../../health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_1.dart';
import '../../health/buy_new_policy/company/niva_bupa/viewmodel/proposer_viewmodel.dart';
import '../../health/buy_new_policy/company/star/view/star_screen.dart';
import '../../term/buy_new_policy/company/bajaj/view/benifit_screen.dart';
import '../../term/buy_new_policy/company/sampoorna_raksha/view/policy_summary_screen.dart';

class Invest extends StatelessWidget {
  const Invest({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Elevated Buttons with responsive sizes
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Insurance(),
                      ),
                    );
                  },
                  child: const Text("Insurance"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(
                      screenWidth * 0.8,
                      screenHeight * 0.07,
                    ), // Responsive button size
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive space
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            SampoornaRakshaPolicySummaryScreen(),
                      ),
                    );
                  },
                  child: const Text("Sampoorna Raksha"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive space
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NivaMedicalScreen1(),
                      ),
                    );
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return NivaBupaSelfBottomSheet(); // Your bottom sheet widget here
                    //   },
                    // );
                  },
                  child: const Text("Niva medical"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive space
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) =>  MedicalScreen();
                    //   ),
                    // );
                  },
                  child: const Text("Stepper"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BajajBenefitScreen(),
                      ),
                    );
                  },
                  child: const Text("Bajaj"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NivaMedicalScreen1(),
                      ),
                    );
                  },
                  child: const Text("Niva Steper"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NivaBupaCompleteKycScreen(),
                      ),
                    );
                  },
                  child: const Text("Complete Kyc"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NivaBupaScreen()),
                    );
                  },
                  child: Text('Niva Bupa'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  child: const Text("Self"),
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (_) => CareSupremeSelfBottomSheet(),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return ChangeNotifierProvider(
                          create: (_) => NivaProposerViewModel(),
                          child: NivaBupaProposerBottomSheet(),
                        );
                      },
                    );
                  },
                  child: Text('Niva Proposer'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => StarScreen()),
                    );
                  },
                  child: const Text("Star"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CareSupremeScreen(),
                      ),
                    );
                  },
                  child: const Text("care supreme"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(screenWidth * 0.8, screenHeight * 0.07),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
