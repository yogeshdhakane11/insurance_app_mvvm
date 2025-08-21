import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/duration_screen.dart';
import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/stepper/medical_screen_1.dart';
import 'package:insurance/features/health/buy_new_policy/company/care_supreme/view/stepper/member_info_screen_2.dart';
import 'package:insurance/features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_4.dart';
import 'package:insurance/features/health/buy_new_policy/company/niva_bupa/view/stepper/members_screen.dart';
import 'package:insurance/features/term/buy_new_policy/company/sampoorna_raksha/view/request_recieved_screen.dart';
import 'package:insurance/features/term/term_claim_center/term_claim_centre_screen.dart';
import 'package:insurance/routes/routes_name.dart';

import '../features/auth/view/login_screen.dart';
import '../features/chatbot/chat_screen.dart';
import '../features/dashboard/screen/Insurance_Screen.dart';
import '../features/dashboard/screen/dashboard_screen.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/care_supreme_screen.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/checkout_screen.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/complete_kyc.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/payment_gateway_screen.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/proposer_screen.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/self_screen.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/stepper/medical_screen_2.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/stepper/medical_screen_3.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/stepper/medical_screen_4.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/stepper/medical_screen_5.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/stepper/member_info_screen_1.dart';
import '../features/health/buy_new_policy/company/care_supreme/view/stepper/nominee_screen.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/checkout_screen.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/complete_kyc.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/custumize_plan__screen.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/niva_bupa_screen.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/payment_gateway.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/proposer_bottomsheet.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/self_bottomsheet.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_1.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_10.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_11.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_2.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_3.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_5.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_6.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_7.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_8.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/medical_screen_9.dart';
import '../features/health/buy_new_policy/company/niva_bupa/view/stepper/nominee_screen.dart';
import '../features/health/buy_new_policy/company/star/view/duration_screen.dart';
import '../features/health/buy_new_policy/company/star/view/policy_summey.dart';
import '../features/health/buy_new_policy/company/star/view/request_received_screen.dart';
import '../features/health/buy_new_policy/company/star/view/star_screen.dart';
import '../features/health/buy_new_policy/insurance_card/view/health_choose_your_plan.dart';
import '../features/health/health_claim_center/health_claim_center.dart';
import '../features/insurance/health_section/buy_policy_card.dart';
import '../features/insurance/insurance_section/assistance_support_section.dart';
import '../features/insurance/insurance_section/expert_advice_section.dart';
import '../features/insurance/mypolicy_trackpolicy/my_policy_card.dart';
import '../features/my_policy/policy_screen/insurance_type_screen.dart';
import '../features/my_policy/policy_screen/my_policy_screen.dart';
import '../features/term/buy_new_policy/company/bajaj/view/benifit_screen.dart';
import '../features/term/buy_new_policy/company/bajaj/view/policy_summary_screen.dart';
import '../features/term/buy_new_policy/company/bajaj/view/request_recieved_screen.dart';
import '../features/term/buy_new_policy/company/sampoorna_raksha/view/benifit_screen.dart';
import '../features/term/buy_new_policy/company/sampoorna_raksha/view/policy_summary_screen.dart';
import '../features/term/buy_new_policy/personalization/view/personalize_bottom_sheet.dart';
import '../features/term/buy_new_policy/recommentation/recomentation_screen.dart';
import '../features/term/buy_new_policy/term_card/view/term_plan_screen.dart';
import '../features/track_policy/track_policy_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.loginScreen:
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case RouteNames.dashBoardScreen:
        return CupertinoPageRoute(builder: (_) => DashBoardScreen());
      case RouteNames.chatScreen:
        return CupertinoPageRoute(builder: (_) => ChatScreen());
      case RouteNames.insuranceScreen:
        return CupertinoPageRoute(builder: (_) => Insurance());
      case RouteNames.healthClaimCenterScreen:
        return CupertinoPageRoute(builder: (_) => HealthClaimCenterScreen());
      case RouteNames.healthInsuranceBuyPolicyCard:
        return CupertinoPageRoute(
          builder: (_) => HealthInsuranceBuyPolicyCard(),
        );
      case RouteNames.assistanceSupportSectionScreen:
        return CupertinoPageRoute(
          builder: (_) => AssistanceSupportSectionScreen(),
        );
      case RouteNames.expertAdviceSectionScreen:
        return CupertinoPageRoute(builder: (_) => ExpertAdviceSectionScreen());
      case RouteNames.myPolicyScreen:
        return CupertinoPageRoute(builder: (_) => MyPolicyScreen());
      case RouteNames.myPolicyCard:
        return CupertinoPageRoute(builder: (_) => MyPolicyCard());
      case RouteNames.insuranceTypeBottomSheet:
        return CupertinoPageRoute(builder: (_) => InsuranceTypeBottomSheet());
      case RouteNames.trackPolicyScreen:
        return CupertinoPageRoute(builder: (_) => TrackPolicyTabBarScreen());
      case RouteNames.personalizeBottomSheetScreen:
        return CupertinoPageRoute(builder: (_) => PersonalizeBottomSheet());
      case RouteNames.termRecommentationScreen:
        return CupertinoPageRoute(builder: (_) => TearmRecommendationScreen());
      case RouteNames.termPlanScreen:
        return CupertinoPageRoute(builder: (_) => TermPlanScreen());
      case RouteNames.termClaimCenterPage:
        return CupertinoPageRoute(builder: (_) => TermClaimCentrePage());
      // Sampoorna Raksha
      case RouteNames.sampoornaRakshaPolicySummaryScreen:
        return CupertinoPageRoute(
          builder: (_) => SampoornaRakshaPolicySummaryScreen(),
        );
      case RouteNames.sampoornaRakshaPromiseScreen:
        return CupertinoPageRoute(
          builder: (_) => SampoornaRakshaPromiseScreen(),
        );
      case RouteNames.sampoornaRakshaRequestReceivedScreen:
        return CupertinoPageRoute(
          builder: (_) => SampoornaRakshaRequestReceivedScreen(),
        );
      // Bajaj
      case RouteNames.bajajRequestReceivedScreen:
        return CupertinoPageRoute(builder: (_) => BajajRequestReceivedScreen());
      case RouteNames.bajajPolicySummaryScreen:
        return CupertinoPageRoute(builder: (_) => BajajPolicySummaryScreen());
      case RouteNames.bajajBenefitScreen:
        return CupertinoPageRoute(builder: (_) => BajajBenefitScreen());
      case RouteNames.healthChoosePlanScreen:
        return CupertinoPageRoute(builder: (_) => HealthChoosePlanScreen());
      // Star
      case RouteNames.starScreen:
        return CupertinoPageRoute(builder: (_) => StarScreen());
      case RouteNames.starDurationScreen:
        return CupertinoPageRoute(builder: (_) => StarDurationScreen());
      case RouteNames.starPolicySummaryScreen:
        return CupertinoPageRoute(builder: (_) => StarPolicySummaryScreen());
      case RouteNames.starRequestReceivedScreen:
        return CupertinoPageRoute(builder: (_) => StarRequestReceivedScreen());
      // Niva Bupa
      case RouteNames.nivaBupaScreen:
        return CupertinoPageRoute(builder: (_) => NivaBupaScreen());
      case RouteNames.nivaCompleteKycScreen:
        return CupertinoPageRoute(builder: (_) => NivaBupaCompleteKycScreen());
      case RouteNames.nivaBupaCheckoutScreen:
        return CupertinoPageRoute(builder: (_) => NivaBupaCheckoutScreen());
      case RouteNames.nivaBupaDurationScreen:
        return CupertinoPageRoute(builder: (_) => NivaBupaDurationScreen());
      case RouteNames.nivaBupaProposerBottomSheet:
        return CupertinoPageRoute(
          builder: (_) => NivaBupaProposerBottomSheet(),
        );
      case RouteNames.nivaBupaSelfBottomSheet:
        return CupertinoPageRoute(builder: (_) => NivaBupaSelfBottomSheet());
      case RouteNames.nivaBupaPaymentGatewayScreen:
        return CupertinoPageRoute(
          builder: (_) => NivaBupaPaymentGatewayScreen(),
        );
      case RouteNames.nivaBupaMembersScreen:
        return CupertinoPageRoute(builder: (_) => NivaBupaMembersScreen());
      case RouteNames.nivaMedicalScreen1:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen1());
      case RouteNames.nivaMedicalScreen2:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen2());
      case RouteNames.nivaMedicalScreen3:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen3());
      case RouteNames.nivaMedicalScreen4:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen4());
      case RouteNames.nivaMedicalScreen5:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen5());
      case RouteNames.nivaMedicalScreen6:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen6());
      case RouteNames.nivaMedicalScreen7:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen7());
      case RouteNames.nivaMedicalScreen8:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen8());
      case RouteNames.nivaMedicalScreen9:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen9());
      case RouteNames.nivaMedicalScreen10:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen10());
      case RouteNames.nivaMedicalScreen11:
        return CupertinoPageRoute(builder: (_) => NivaMedicalScreen11());
      case RouteNames.nivaBupaNomineeScreen:
        return CupertinoPageRoute(builder: (_) => NivaBupaNomineeScreen());
      // Care Supreme
      case RouteNames.careSupremeScreen:
        return CupertinoPageRoute(builder: (_) => CareSupremeScreen());
      case RouteNames.careSupremeDurationScreen:
        return CupertinoPageRoute(builder: (_) => CareSupremeDurationScreen());
      case RouteNames.careSupremeCheckoutScreen:
        return CupertinoPageRoute(builder: (_) => CareSupremeCheckoutScreen());
      case RouteNames.careSupremePaymentGatewayScreen:
        return CupertinoPageRoute(
          builder: (_) => CareSupremePaymentGatewayScreen(),
        );
      case RouteNames.careSupremeProposerBottomSheet:
        return CupertinoPageRoute(
          builder: (_) => CareSupremeProposerBottomSheet(),
        );
      case RouteNames.careSupremeSelfBottomSheet:
        return CupertinoPageRoute(builder: (_) => CareSupremeSelfBottomSheet());
      case RouteNames.careSupremeCompleteKycScreen:
        return CupertinoPageRoute(
          builder: (_) => CareSupremeCompleteKycScreen(),
        );
      case RouteNames.careSupremeMemberInfoScreen_1:
        return CupertinoPageRoute(
          builder: (_) => CareSupremeMemberInfoScreen_1(),
        );
      case RouteNames.careSupremeMemberInfoScreen_2:
        return CupertinoPageRoute(
          builder: (_) => CareSupremeMemberInfoScreen_2(),
        );
      case RouteNames.careSupremeNomineeScreen:
        return CupertinoPageRoute(builder: (_) => CareSupremeNomineeScreen());
      case RouteNames.careSupremeMedicalScreen1:
        return CupertinoPageRoute(builder: (_) => CareSupremeMedicalScreen1());
      case RouteNames.careSupremeMedicalScreen2:
        return CupertinoPageRoute(builder: (_) => CareSupremeMedicalScreen2());
      case RouteNames.careSupremeMedicalScreen3:
        return CupertinoPageRoute(builder: (_) => CareSupremeMedicalScreen3());
      case RouteNames.careSupremeMedicalScreen4:
        return CupertinoPageRoute(builder: (_) => CareSupremeMedicalScreen4());
      case RouteNames.careSupremeMedicalScreen5:
        return CupertinoPageRoute(builder: (_) => CareSupremeMedicalScreen5());
      default:
        return CupertinoPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}

// import 'package:go_router/go_router.dart';
// import 'package:insurance/routes/routes_name.dart';
// import '../features/auth/view/login_screen.dart';
// import '../features/dashboard/screen/dashboard_screen.dart';
//
// final GoRouter appRouter = GoRouter(
//   initialLocation: RouteNames.splashScreen,
//   routes: [
//     GoRoute(
//       path: RouteNames.splashScreen,
//       builder: (context, state) => LoginScreen(),
//     ),
//   ],
// );
//
