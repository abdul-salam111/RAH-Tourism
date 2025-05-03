class CardDetailsModel {
  final String cardHolderName;
  final String cardNumber;
  final String cvv;
  final String expiryDate;
  final String cardType;

  CardDetailsModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expiryDate,
    required this.cardType,
  });

  // Factory constructor to create a model from JSON
  factory CardDetailsModel.fromJson(Map<String, dynamic> json) {
    return CardDetailsModel(
      cardHolderName: json['cardHolderName'] ?? '',
      cardNumber: json['cardNumber'] ?? '',
      cvv: json['cvv'] ?? '',
      expiryDate: json['expiryDate'] ?? '',
      cardType: json['cardType'] ?? '',
    );
  }

  // Method to convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'cvv': cvv,
      'expiryDate': expiryDate,
      'cardType': cardType,
    };
  }
}
