class EnventoryItem {
  String imageAsset;
  String name;
  String? uniqId;
  String id;
  String type;
  String rarity;
  int amount;

  EnventoryItem({
    required this.id,
    required this.name,
    this.uniqId,
    required this.imageAsset,
    required this.type,
    required this.rarity,
    required this.amount,
  });
}
