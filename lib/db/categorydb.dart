import 'package:pmm/model/datamodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

const openbox = 'open hive';

abstract class Categorydb {
  Future<List<CategoryModel>> getcategory();
  Future<void> insertcategory(CategoryModel categoryModel);
}

class Category implements Categorydb {
  @override
  Future<void> insertcategory(CategoryModel categoryModel) async {
    final _opendb = await Hive.openBox<CategoryModel>(openbox);
    _opendb.add(categoryModel);
  }

  @override
  Future<List<CategoryModel>> getcategory() async {
    final _opendb = await Hive.openBox<CategoryModel>(openbox);

    return _opendb.values.toList();
  }
}
