class CartCase {
  late String id;
  late String title;
  late String stay;
  late String section;

  CartCase(
      this.id,
      this.title,
      this.stay,
      this.section
      );
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'stay': stay,
      'section': section,
    };
  }
}