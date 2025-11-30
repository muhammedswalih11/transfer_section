class ContactModel {
  final String name;
  final String accountNo;
  final String bank;
  final String? dp;
  final bool isFavorite;

  ContactModel({
    required this.name,
    required this.accountNo,
    required this.bank,
    this.dp,
    this.isFavorite = false,
  });
}
