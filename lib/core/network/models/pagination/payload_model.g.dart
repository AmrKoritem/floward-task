// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayloadModelImpl _$$PayloadModelImplFromJson(Map<String, dynamic> json) =>
    _$PayloadModelImpl(
      pagination: json['pagination'] == null
          ? null
          : PaginationModel.fromJson(
              json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PayloadModelImplToJson(_$PayloadModelImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };
