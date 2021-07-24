class WealthSummary {
  final double profitability;
  final bool hasHistory;
  final double cdi;
  final int total;
  final int gain;

  WealthSummary({
    required this.profitability,
    required this.hasHistory,
    required this.total,
    required this.gain,
    required this.cdi,
  });

  factory WealthSummary.fromJson(Map<String, dynamic> json) {
    return WealthSummary(
      total: int.parse(json['total'].toString().replaceAll('.', '')),
      gain: int.parse(json['gain'].toString().replaceAll('.', '')),
      cdi: double.parse(json['cdi'].toString()),
      profitability: json['profitability'],
      hasHistory: json['hasHistory'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profitability': profitability,
      'hasHistory': hasHistory,
      'total': total,
      'gain': gain,
      'cdi': cdi,
    };
  }
}
