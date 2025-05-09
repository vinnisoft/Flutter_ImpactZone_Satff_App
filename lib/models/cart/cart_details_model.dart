class CartDetails {
  final double netTotal;
  final double total;
  final double tax;
  final double discount;
  final double specialDiscount;
  final double promoDiscount;
  final double waivedTaxAmount;
  final double gradTotal;

  CartDetails({
    this.netTotal = 0.0,
    this.total = 0.0,
    this.tax = 0.0,
    this.discount = 0.0,
    this.specialDiscount = 0.0,
    this.promoDiscount = 0.0,
    this.waivedTaxAmount = 0.0,
    this.gradTotal = 0.0,
  });

  factory CartDetails.fromJson(Map<String, dynamic> json) {
    return CartDetails(
      netTotal: (json['netTotal'] as num?)?.toDouble() ?? 0.0,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      specialDiscount: (json['specialDiscount'] as num?)?.toDouble() ?? 0.0,
      promoDiscount: (json['promoDiscount'] as num?)?.toDouble() ?? 0.0,
      waivedTaxAmount: (json['waivedTaxAmount'] as num?)?.toDouble() ?? 0.0,
      gradTotal: (json['gradTotal'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'netTotal': netTotal,
      'total': total,
      'tax': tax,
      'discount': discount,
      'specialDiscount': specialDiscount,
      'promoDiscount': promoDiscount,
      'waivedTaxAmount': waivedTaxAmount,
      'gradTotal': gradTotal,
    };
  }

  CartDetails copyWith({
    double? netTotal,
    double? total,
    double? tax,
    double? discount,
    double? specialDiscount,
    double? promoDiscount,
    double? waivedTaxAmount,
    double? gradTotal,
  }) {
    return CartDetails(
      netTotal: netTotal ?? this.netTotal,
      total: total ?? this.total,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
      specialDiscount: specialDiscount ?? this.specialDiscount,
      promoDiscount: promoDiscount ?? this.promoDiscount,
      waivedTaxAmount: waivedTaxAmount ?? this.waivedTaxAmount,
      gradTotal: gradTotal ?? this.gradTotal,
    );
  }
}
