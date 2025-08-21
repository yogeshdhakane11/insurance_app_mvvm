import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/const/app_asset.dart';
import 'package:insurance/routes/routes_name.dart';
import 'package:provider/provider.dart';
import '../filter_viewmodel.dart';
import '../model/models.dart';
import '../widget/insurance_card.dart';

class TermPlanScreen extends StatelessWidget {
  const TermPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yogesh',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:
                    screenWidth *
                    0.05, // Adjust font size based on screen width
                color: Colors.black,
              ),
            ),
            Text(
              '22 years • ₹6.0L • Non-Smoker',
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (_) => FilterViewModel(),
        child: Consumer<FilterViewModel>(
          builder: (context, viewmodel, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(
                  screenWidth * 0.04,
                ), // Responsive padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- Filter Buttons Section ---
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            _buildFilterButton(
                              context,
                              title: viewmodel.lifeCover,
                              onTap: () => _showBottomSheet(
                                context,
                                'Life Cover',
                                ['₹50.0L', '₹1.0Cr', '₹1.5Cr', '₹2.0Cr'],
                                viewmodel.updateLifeCover,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ), // Adjust spacing
                            _buildFilterButton(
                              context,
                              title: viewmodel.coverTillAge,
                              onTap: () => _showBottomSheet(
                                context,
                                'Cover till age',
                                List.generate(
                                  14,
                                  (index) => '${57 + index} years',
                                ),
                                viewmodel.updateCoverTillAge,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02), // Adjust spacing
                        Row(
                          children: [
                            _buildFilterButton(
                              context,
                              title: viewmodel.payFor,
                              onTap: () => _showBottomSheet(
                                context,
                                'Pay For',
                                List.generate(
                                  13,
                                  (index) => '${8 + index} years',
                                ),
                                viewmodel.updatePayFor,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ), // Adjust spacing
                            _buildFilterButton(
                              context,
                              title: viewmodel.paymentFreq,
                              onTap: () => _showBottomSheet(
                                context,
                                'Payment Frequency',
                                [
                                  'Annually',
                                  'Half-Yearly',
                                  'Quarterly',
                                  'Monthly',
                                ],
                                viewmodel.updatePaymentFreq,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03), // Adjust spacing
                    // Cards list remains same...
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Term Plans',
                          style: TextStyle(
                            fontSize:
                                screenWidth * 0.047, // Responsive font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        OutlinedButton.icon(
                          onPressed: () {
                            // Respond to button press
                          },
                          icon: const Icon(Icons.compare_arrows, size: 20),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  screenWidth * 0.02, // Responsive padding
                              vertical:
                                  screenHeight * 0.01, // Responsive padding
                            ),
                            side: const BorderSide(
                              color: Colors.blue,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          label: Text("Compare"),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02), // Adjust spacing
                    // --- List of Insurance Plans ---
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InsuranceCard(
                          plan: InsurancePlan(
                            companyLogo: AppAsset.hdfcLogo,
                            companyName: 'HDFC Life',
                            planName: 'HDFC Life Click 2 Protect Super',
                            premium: '₹7,540/year',
                            claimSettlementRatio: '99.5 %',
                            maxCoverTillAge: '85 years',
                            benefits: [
                              'Smart Exit Benefit',
                              'Extend your policy term at Maturity',
                              'Terminal Illness Benefit',
                            ],
                            addons: [],
                            discount: null,
                            showBuyNow: true,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('HDFC Life')),
                            );
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02), // Adjust spacing
                        InsuranceCard(
                          plan: InsurancePlan(
                            companyLogo: AppAsset.bajajLogo,
                            companyName: 'Bajaj Allianz',
                            planName: 'Bajaj Allianz eTouch Life',
                            premium: '₹6,565/year',
                            claimSettlementRatio: '99.23 %',
                            maxCoverTillAge: '99 years',
                            benefits: [
                              'Lower Premium for Salaried Individuals',
                              'Smart Exit Option after Age 60',
                              'Protection against Terminal Illness',
                            ],
                            addons: [],
                            discount: '10 % discount on first year premium',
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.bajajBenefitScreen,
                            );
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02), // Adjust spacing
                        InsuranceCard(
                          plan: InsurancePlan(
                            companyLogo: AppAsset.sampurnaRakshaLogo,
                            companyName: 'TATA AIA',
                            planName: 'Sampoorna Raksha Promise',
                            premium: '₹7,569/year',
                            claimSettlementRatio: '99.13 %',
                            maxCoverTillAge: '100 years',
                            benefits: [
                              'Sum Assured Top-Up',
                              'Life Stage option',
                              'Special Exit Benefit',
                            ],
                            addons: [
                              'Accidental Death Benefit',
                              'Disability Benefits',
                              'Critical Illness',
                              'Hospitalisation Cover',
                            ],
                            discount: null,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.sampoornaRakshaPromiseScreen,
                            );
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02), // Adjust spacing
                        InsuranceCard(
                          plan: InsurancePlan(
                            companyLogo: AppAsset.icicLogo,
                            companyName: 'ICICI Prudential',
                            planName: 'ICICI Prudential iProtect Smart',
                            premium: '₹6,646/year',
                            claimSettlementRatio: '99.3 %',
                            maxCoverTillAge: '99 years',
                            benefits: [
                              'Permanent Disability Cover',
                              'Terminal Illness Benefit',
                              'Smart Exit Benefit',
                            ],
                            addons: [
                              'Accidental Benefit',
                              'Critical Illness Cover',
                            ],
                            discount:
                                'Upto 15 % discount on first year premium',
                            showBuyNow: true,
                          ),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('ICICI Prudential')),
                            );
                          },
                        ),
                        SizedBox(height: screenHeight * 0.02), // Adjust spacing
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterButton(
    BuildContext context, {
    required String title,
    required VoidCallback onTap,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.015,
            horizontal: screenWidth * 0.05,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(fontSize: screenWidth * 0.04),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(
    BuildContext context,
    String title,
    List<String> options,
    Function(String) onSelected,
  ) {
    int selectedIndex = options.indexOf(options.first);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return SizedBox(
          height:
              MediaQuery.of(context).size.height *
              0.5, // Dynamic height for the bottom sheet
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          options[selectedIndex],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              // const Divider(height: 1),
              Expanded(
                child: CupertinoPicker(
                  scrollController: FixedExtentScrollController(
                    initialItem: selectedIndex,
                  ),
                  itemExtent: 36,
                  magnification: 1.2,
                  squeeze: 1.0,
                  onSelectedItemChanged: (int index) {
                    selectedIndex = index;
                  },
                  children: options
                      .map((item) => Center(child: Text(item)))
                      .toList(),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        onSelected(options[selectedIndex]);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
