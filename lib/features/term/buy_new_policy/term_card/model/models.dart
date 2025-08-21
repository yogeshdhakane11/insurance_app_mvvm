class InsurancePlan {
  final String companyLogo;
  final String companyName;
  final String planName;
  final String premium;
  final String claimSettlementRatio;
  final String maxCoverTillAge;
  final List<String> benefits;
  final List<String> addons;
  final String? discount;
  final bool showBuyNow; // New property to control "Buy Now" visibility

  // Constructor for the InsurancePlan class
  InsurancePlan({
    required this.companyLogo,
    required this.companyName,
    required this.planName,
    required this.premium,
    required this.claimSettlementRatio,
    required this.maxCoverTillAge,
    required this.benefits,
    required this.addons,
    this.discount,
    this.showBuyNow = false, // Default to false if not provided
  });
}
