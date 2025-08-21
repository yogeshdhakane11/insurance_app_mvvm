import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insurance/features/term/buy_new_policy/company/bajaj/view/request_recieved_screen.dart';
import '../../../../../../routes/routes_name.dart';
import '../../../../../../utils/url_launch.dart';

class BajajPolicySummaryScreen extends StatelessWidget {
  const BajajPolicySummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Policy Summary'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(
            width * 0.04,
          ), // 4% of screen width for padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Policy Container
              Container(
                padding: EdgeInsets.all(width * 0.04), // 4% of screen width
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://logo.clearbit.com/bajajauto.com",
                                width:
                                    width *
                                    0.08, // Adjust width based on screen size
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ), // 5% of screen width for spacing
                              const Text(
                                "Bajaj Allianz eTouch Life",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Yogesh will have a life cover of ',
                                  style: TextStyle(fontSize: 14),
                                ),
                                TextSpan(
                                  text: '₹50.0L',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' till the age of ',
                                  style: TextStyle(fontSize: 14),
                                ),
                                TextSpan(
                                  text: '54 years',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 11),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Yogesh",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ), // 2% of screen height
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Age",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "20 Years",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Occupation",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Salaried",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Smoke/Tobacco",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "No",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Annual Income",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "₹4,00,000",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.03), // 3% of screen height
              // Price Breakdown
              Container(
                padding: EdgeInsets.all(width * 0.04), // 4% of screen width
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade100, blurRadius: 6),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.01), // 1% of screen height
                    const Text(
                      "Price Breakdown",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 7),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Base Premium",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              "₹6,162 ",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "(inclusive of taxes)",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02), // 2% of screen height
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Premium",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              "₹10,883 ",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "(inclusive of taxes)",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "(yearly)",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03), // 3% of screen height
              Padding(
                padding: EdgeInsets.all(width * 0.02), // 2% of screen width
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        UrlLaunch.openPdf(pdfPath: 'assets/claim_form.pdf');
                      },
                      child: Row(
                        children: [
                          Icon(Icons.download_outlined, color: Colors.blue),
                          SizedBox(width: width * 0.03), // 3% of screen width
                          Text(
                            'Benefit Illustration',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.download_outlined, color: Colors.blue),
                        SizedBox(width: width * 0.03),
                        Text(
                          'Policy Brochure',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(width * 0.02),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.download_outlined, color: Colors.blue),
                        SizedBox(width: width * 0.03),
                        Text(
                          'Required Documents',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Amount (inc of taxes)',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '₹6,162 ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      TextSpan(
                        text: '/year',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey, // Grey color for "/year"
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.bajajRequestReceivedScreen,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    minimumSize: Size(
                      width * 0.3,
                      height * 0.06,
                    ), // Responsive size
                  ),
                  child: Text('Proceed'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
