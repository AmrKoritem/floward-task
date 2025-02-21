// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationModel _$PaginationModelFromJson(Map<String, dynamic> json) {
  return _PaginationModel.fromJson(json);
}

/// @nodoc
mixin _$PaginationModel {
  int? get total => throw _privateConstructorUsedError;
  set total(int? value) => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  set page(int? value) => throw _privateConstructorUsedError;
  int? get from => throw _privateConstructorUsedError;
  set from(int? value) => throw _privateConstructorUsedError;
  int? get to => throw _privateConstructorUsedError;
  set to(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  set lastPage(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_per_page')
  int? get itemsPerPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'items_per_page')
  set itemsPerPage(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_page_url')
  String? get firstPageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_page_url')
  set firstPageUrl(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_page_url')
  String? get nextPageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_page_url')
  set nextPageUrl(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'prev_page_url')
  String? get prevPageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'prev_page_url')
  set prevPageUrl(String? value) => throw _privateConstructorUsedError;
  List<LinkModel>? get links => throw _privateConstructorUsedError;
  set links(List<LinkModel>? value) => throw _privateConstructorUsedError;

  /// Serializes this PaginationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationModelCopyWith<PaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<$Res> {
  factory $PaginationModelCopyWith(
          PaginationModel value, $Res Function(PaginationModel) then) =
      _$PaginationModelCopyWithImpl<$Res, PaginationModel>;
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? from,
      int? to,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'items_per_page') int? itemsPerPage,
      @JsonKey(name: 'first_page_url') String? firstPageUrl,
      @JsonKey(name: 'next_page_url') String? nextPageUrl,
      @JsonKey(name: 'prev_page_url') String? prevPageUrl,
      List<LinkModel>? links});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<$Res, $Val extends PaginationModel>
    implements $PaginationModelCopyWith<$Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? lastPage = freezed,
    Object? itemsPerPage = freezed,
    Object? firstPageUrl = freezed,
    Object? nextPageUrl = freezed,
    Object? prevPageUrl = freezed,
    Object? links = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsPerPage: freezed == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationModelImplCopyWith<$Res>
    implements $PaginationModelCopyWith<$Res> {
  factory _$$PaginationModelImplCopyWith(_$PaginationModelImpl value,
          $Res Function(_$PaginationModelImpl) then) =
      __$$PaginationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? total,
      int? page,
      int? from,
      int? to,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'items_per_page') int? itemsPerPage,
      @JsonKey(name: 'first_page_url') String? firstPageUrl,
      @JsonKey(name: 'next_page_url') String? nextPageUrl,
      @JsonKey(name: 'prev_page_url') String? prevPageUrl,
      List<LinkModel>? links});
}

/// @nodoc
class __$$PaginationModelImplCopyWithImpl<$Res>
    extends _$PaginationModelCopyWithImpl<$Res, _$PaginationModelImpl>
    implements _$$PaginationModelImplCopyWith<$Res> {
  __$$PaginationModelImplCopyWithImpl(
      _$PaginationModelImpl _value, $Res Function(_$PaginationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? page = freezed,
    Object? from = freezed,
    Object? to = freezed,
    Object? lastPage = freezed,
    Object? itemsPerPage = freezed,
    Object? firstPageUrl = freezed,
    Object? nextPageUrl = freezed,
    Object? prevPageUrl = freezed,
    Object? links = freezed,
  }) {
    return _then(_$PaginationModelImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: freezed == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int?,
      itemsPerPage: freezed == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int?,
      firstPageUrl: freezed == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      links: freezed == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<LinkModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationModelImpl implements _PaginationModel {
  _$PaginationModelImpl(
      {this.total,
      this.page,
      this.from,
      this.to,
      @JsonKey(name: 'last_page') this.lastPage,
      @JsonKey(name: 'items_per_page') this.itemsPerPage,
      @JsonKey(name: 'first_page_url') this.firstPageUrl,
      @JsonKey(name: 'next_page_url') this.nextPageUrl,
      @JsonKey(name: 'prev_page_url') this.prevPageUrl,
      this.links});

  factory _$PaginationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationModelImplFromJson(json);

  @override
  int? total;
  @override
  int? page;
  @override
  int? from;
  @override
  int? to;
  @override
  @JsonKey(name: 'last_page')
  int? lastPage;
  @override
  @JsonKey(name: 'items_per_page')
  int? itemsPerPage;
  @override
  @JsonKey(name: 'first_page_url')
  String? firstPageUrl;
  @override
  @JsonKey(name: 'next_page_url')
  String? nextPageUrl;
  @override
  @JsonKey(name: 'prev_page_url')
  String? prevPageUrl;
  @override
  List<LinkModel>? links;

  @override
  String toString() {
    return 'PaginationModel(total: $total, page: $page, from: $from, to: $to, lastPage: $lastPage, itemsPerPage: $itemsPerPage, firstPageUrl: $firstPageUrl, nextPageUrl: $nextPageUrl, prevPageUrl: $prevPageUrl, links: $links)';
  }

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      __$$PaginationModelImplCopyWithImpl<_$PaginationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationModelImplToJson(
      this,
    );
  }
}

abstract class _PaginationModel implements PaginationModel {
  factory _PaginationModel(
      {int? total,
      int? page,
      int? from,
      int? to,
      @JsonKey(name: 'last_page') int? lastPage,
      @JsonKey(name: 'items_per_page') int? itemsPerPage,
      @JsonKey(name: 'first_page_url') String? firstPageUrl,
      @JsonKey(name: 'next_page_url') String? nextPageUrl,
      @JsonKey(name: 'prev_page_url') String? prevPageUrl,
      List<LinkModel>? links}) = _$PaginationModelImpl;

  factory _PaginationModel.fromJson(Map<String, dynamic> json) =
      _$PaginationModelImpl.fromJson;

  @override
  int? get total;
  set total(int? value);
  @override
  int? get page;
  set page(int? value);
  @override
  int? get from;
  set from(int? value);
  @override
  int? get to;
  set to(int? value);
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;
  @JsonKey(name: 'last_page')
  set lastPage(int? value);
  @override
  @JsonKey(name: 'items_per_page')
  int? get itemsPerPage;
  @JsonKey(name: 'items_per_page')
  set itemsPerPage(int? value);
  @override
  @JsonKey(name: 'first_page_url')
  String? get firstPageUrl;
  @JsonKey(name: 'first_page_url')
  set firstPageUrl(String? value);
  @override
  @JsonKey(name: 'next_page_url')
  String? get nextPageUrl;
  @JsonKey(name: 'next_page_url')
  set nextPageUrl(String? value);
  @override
  @JsonKey(name: 'prev_page_url')
  String? get prevPageUrl;
  @JsonKey(name: 'prev_page_url')
  set prevPageUrl(String? value);
  @override
  List<LinkModel>? get links;
  set links(List<LinkModel>? value);

  /// Create a copy of PaginationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationModelImplCopyWith<_$PaginationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
