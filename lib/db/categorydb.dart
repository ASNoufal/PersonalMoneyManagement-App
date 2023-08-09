import 'package:flutter/foundation.dart';
import 'package:pmm/model/datamodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

const openbox = 'open hive';

abstract class Categorydb {
  Future<List<CategoryModel>> getcategory();
  Future<void> insertcategory(CategoryModel categoryModel);
  Future<void> deleteitems(String id);
}

class Category implements Categorydb {
  Category._internal();

  static Category intervel = Category._internal();
  factory Category() {
    return intervel;
  }

  ValueNotifier<List<CategoryModel>> incomecategory = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenxecategory = ValueNotifier([]);

  @override
  Future<void> insertcategory(CategoryModel categoryModel) async {
    final _opendb = await Hive.openBox<CategoryModel>(openbox);
    await _opendb.put(categoryModel.id, categoryModel);
    refreshui();
  }

  @override
  Future<List<CategoryModel>> getcategory() async {
    final _opendb = await Hive.openBox<CategoryModel>(openbox);

    return _opendb.values.toList();
  }

  Future<void> refreshui() async {
    final allcategory = await getcategory();
    incomecategory.value.clear();
    expenxecategory.value.clear();
    for (var element in allcategory) {
      if (element.type == CategoryType.income) {
        incomecategory.value.add(element);
      } else {
        expenxecategory.value.add(element);
      }
    }
    incomecategory.notifyListeners();
    expenxecategory.notifyListeners();
  }

  @override
  Future<void> deleteitems(String id) async {
    final _opendb = await Hive.openBox<CategoryModel>(openbox);
    _opendb.delete(id);
    refreshui();
  }
}
