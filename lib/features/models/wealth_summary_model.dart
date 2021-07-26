class WealthSummary {
  final String profitability;
  final bool hasHistory;
  final String gain;
  final String cdi;
  final int total;
  final int id;

  WealthSummary({
    required this.profitability,
    required this.hasHistory,
    required this.total,
    required this.gain,
    required this.cdi,
    required this.id,
  });

  factory WealthSummary.fromJson(Map<String, dynamic> json) {
    return WealthSummary(
      total: int.parse(json['total'].toString().replaceAll('.', '')),
      profitability: json['profitability'].toString(),
      cdi: json['cdi'].toString().replaceAll('.', ''),
      hasHistory: json['hasHistory'],
      gain: json['gain'].toString(),
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profitability': profitability,
      'hasHistory': hasHistory,
      'total': total,
      'gain': gain,
      'cdi': cdi,
      'id': id,
    };
  }
}
