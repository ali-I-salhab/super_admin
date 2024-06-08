class GroupModel {
  final String id;
  final String name;
  bool selected;
  final List<String> countries;
  GroupModel(
    this.countries,
    this.id, {
    required this.name,
    required this.selected,
  });
}
