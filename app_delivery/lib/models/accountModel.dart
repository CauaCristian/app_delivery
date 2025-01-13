class AccountModel {
  final int id;
  final String name;
  final String email;
  final String cellPhone;
  List<String> address;
  List<String>? cards;
  AccountModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.cellPhone,
      required this.address,
      this.cards});
}
