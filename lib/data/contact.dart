class Contact {
  late String name;
  late String email;
  late String phoneNumber;
  bool isFavorite;

  Contact({
    required this.email,
    required this.name,
    required this.phoneNumber,
    this.isFavorite = false,
  });
}
