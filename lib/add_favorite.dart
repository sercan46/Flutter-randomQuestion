import 'package:hive/hive.dart';

part 'add_favorite.g.dart';

@HiveType(typeId: 1)
class AddFavorite {
  AddFavorite({required this.id, required this.text});
  @HiveField(0)
  String id;

  @HiveField(1)
  String text;
}
