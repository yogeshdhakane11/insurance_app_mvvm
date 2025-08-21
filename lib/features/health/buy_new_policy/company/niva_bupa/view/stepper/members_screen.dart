import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../routes/routes_name.dart';
import '../../viewmodel/stepper/member_viewmodel.dart';

class NivaBupaMembersScreen extends StatelessWidget {
  const NivaBupaMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery for responsive sizing
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => MemberScreenViewModel(),
      child: Consumer<MemberScreenViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: screenWidth * 0.055),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/niva_bupa.png',
                    width: screenWidth * 0.075,
                    height: screenWidth * 0.075,
                  ),
                  SizedBox(width: screenWidth * 0.0275),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Niva Bupa ReAssure 2.0',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '1 member • ₹10 Lakhs • 1 year',
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 1),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: screenWidth * 0.03,
                          child: Icon(
                            Icons.check,
                            size: screenWidth * 0.04,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 1,
                          minHeight: screenHeight * 0.0025,
                          color: Colors.green,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: CircleAvatar(
                          radius: screenWidth * 0.03,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0,
                          minHeight: screenHeight * 0.0025,
                          color: Colors.green,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: CircleAvatar(
                          radius: screenWidth * 0.03,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01375),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Members',
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                      Text(
                        'Medical',
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                      Text(
                        'Nominee',
                        style: TextStyle(fontSize: screenWidth * 0.035),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.0525),
                  Column(
                    children: [
                      Text(
                        'Member Information',
                        style: TextStyle(fontSize: screenWidth * 0.040),
                      ),
                      SizedBox(height: screenHeight * 0.01375),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate
                          Navigator.pushNamed(
                            context,
                            RouteNames.nivaBupaSelfBottomSheet,
                          );
                        },
                        child: Text('Self'),
                      ),
                      SizedBox(height: screenHeight * 0.01375),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate
                          Navigator.pushNamed(
                            context,
                            RouteNames.nivaBupaProposerBottomSheet,
                          );
                        },
                        child: Text('Proposer'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
