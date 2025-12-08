class Beneficiary {
  final String name;
  final String id;
  final String bank;
  final String? avatarUrl; // optional network image
  final String? localImage; // optional local asset image path
  final bool? isFavourite;
  final bool isDisabled;
  final String? statusText;

  const Beneficiary({
    required this.name,
    required this.id,
    required this.bank,
    this.avatarUrl,
    this.localImage,
    this.isFavourite = false,
    this.isDisabled = false,
    this.statusText,
  });
}
