import 'package:hive_flutter/hive_flutter.dart';
part 'datamodel.g.dart';

@HiveType(typeId: 2)
enum CategoryType {
  @HiveField(0)
  income,
  @HiveField(1)
  expance
}

@HiveType(typeId: 1)
class CategoryModel {
  CategoryModel(
      {required this.id,
      required this.name,
      required this.type,
      this.isdeleted = false});
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool isdeleted;
  @HiveField(3)
  final CategoryType type;
}
