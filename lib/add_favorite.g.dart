// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddFavoriteAdapter extends TypeAdapter<AddFavorite> {
  @override
  final int typeId = 1;

  @override
  AddFavorite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddFavorite(
      id: fields[0] as String,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddFavorite obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddFavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
