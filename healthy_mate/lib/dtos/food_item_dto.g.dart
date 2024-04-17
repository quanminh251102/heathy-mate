// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFoodItemDtoCollection on Isar {
  IsarCollection<FoodItemDto> get foodItemDtos => this.collection();
}

const FoodItemDtoSchema = CollectionSchema(
  name: r'FoodItemDto',
  id: -2589506491563619728,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    ),
    r'nutritionalInfo': PropertySchema(
      id: 1,
      name: r'nutritionalInfo',
      type: IsarType.object,
      target: r'NutritionalInfo',
    ),
    r'portion': PropertySchema(
      id: 2,
      name: r'portion',
      type: IsarType.object,
      target: r'FoodPortion',
    )
  },
  estimateSize: _foodItemDtoEstimateSize,
  serialize: _foodItemDtoSerialize,
  deserialize: _foodItemDtoDeserialize,
  deserializeProp: _foodItemDtoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'FoodPortion': FoodPortionSchema,
    r'NutritionalInfo': NutritionalInfoSchema
  },
  getId: _foodItemDtoGetId,
  getLinks: _foodItemDtoGetLinks,
  attach: _foodItemDtoAttach,
  version: '3.1.0+1',
);

int _foodItemDtoEstimateSize(
  FoodItemDto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nutritionalInfo;
    if (value != null) {
      bytesCount += 3 +
          NutritionalInfoSchema.estimateSize(
              value, allOffsets[NutritionalInfo]!, allOffsets);
    }
  }
  {
    final value = object.portion;
    if (value != null) {
      bytesCount += 3 +
          FoodPortionSchema.estimateSize(
              value, allOffsets[FoodPortion]!, allOffsets);
    }
  }
  return bytesCount;
}

void _foodItemDtoSerialize(
  FoodItemDto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
  writer.writeObject<NutritionalInfo>(
    offsets[1],
    allOffsets,
    NutritionalInfoSchema.serialize,
    object.nutritionalInfo,
  );
  writer.writeObject<FoodPortion>(
    offsets[2],
    allOffsets,
    FoodPortionSchema.serialize,
    object.portion,
  );
}

FoodItemDto _foodItemDtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodItemDto(
    id: id,
    name: reader.readStringOrNull(offsets[0]),
    nutritionalInfo: reader.readObjectOrNull<NutritionalInfo>(
      offsets[1],
      NutritionalInfoSchema.deserialize,
      allOffsets,
    ),
    portion: reader.readObjectOrNull<FoodPortion>(
      offsets[2],
      FoodPortionSchema.deserialize,
      allOffsets,
    ),
  );
  return object;
}

P _foodItemDtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<NutritionalInfo>(
        offset,
        NutritionalInfoSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readObjectOrNull<FoodPortion>(
        offset,
        FoodPortionSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _foodItemDtoGetId(FoodItemDto object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _foodItemDtoGetLinks(FoodItemDto object) {
  return [];
}

void _foodItemDtoAttach(
    IsarCollection<dynamic> col, Id id, FoodItemDto object) {
  object.id = id;
}

extension FoodItemDtoQueryWhereSort
    on QueryBuilder<FoodItemDto, FoodItemDto, QWhere> {
  QueryBuilder<FoodItemDto, FoodItemDto, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FoodItemDtoQueryWhere
    on QueryBuilder<FoodItemDto, FoodItemDto, QWhereClause> {
  QueryBuilder<FoodItemDto, FoodItemDto, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FoodItemDtoQueryFilter
    on QueryBuilder<FoodItemDto, FoodItemDto, QFilterCondition> {
  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition>
      nutritionalInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nutritionalInfo',
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition>
      nutritionalInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nutritionalInfo',
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition>
      portionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portion',
      ));
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition>
      portionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portion',
      ));
    });
  }
}

extension FoodItemDtoQueryObject
    on QueryBuilder<FoodItemDto, FoodItemDto, QFilterCondition> {
  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> nutritionalInfo(
      FilterQuery<NutritionalInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'nutritionalInfo');
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterFilterCondition> portion(
      FilterQuery<FoodPortion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'portion');
    });
  }
}

extension FoodItemDtoQueryLinks
    on QueryBuilder<FoodItemDto, FoodItemDto, QFilterCondition> {}

extension FoodItemDtoQuerySortBy
    on QueryBuilder<FoodItemDto, FoodItemDto, QSortBy> {
  QueryBuilder<FoodItemDto, FoodItemDto, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FoodItemDtoQuerySortThenBy
    on QueryBuilder<FoodItemDto, FoodItemDto, QSortThenBy> {
  QueryBuilder<FoodItemDto, FoodItemDto, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FoodItemDto, FoodItemDto, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FoodItemDtoQueryWhereDistinct
    on QueryBuilder<FoodItemDto, FoodItemDto, QDistinct> {
  QueryBuilder<FoodItemDto, FoodItemDto, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension FoodItemDtoQueryProperty
    on QueryBuilder<FoodItemDto, FoodItemDto, QQueryProperty> {
  QueryBuilder<FoodItemDto, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodItemDto, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<FoodItemDto, NutritionalInfo?, QQueryOperations>
      nutritionalInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nutritionalInfo');
    });
  }

  QueryBuilder<FoodItemDto, FoodPortion?, QQueryOperations> portionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'portion');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FoodPortionSchema = Schema(
  name: r'FoodPortion',
  id: 4019808958201785894,
  properties: {
    r'portionName': PropertySchema(
      id: 0,
      name: r'portionName',
      type: IsarType.string,
    ),
    r'portionSize': PropertySchema(
      id: 1,
      name: r'portionSize',
      type: IsarType.long,
    )
  },
  estimateSize: _foodPortionEstimateSize,
  serialize: _foodPortionSerialize,
  deserialize: _foodPortionDeserialize,
  deserializeProp: _foodPortionDeserializeProp,
);

int _foodPortionEstimateSize(
  FoodPortion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.portionName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _foodPortionSerialize(
  FoodPortion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.portionName);
  writer.writeLong(offsets[1], object.portionSize);
}

FoodPortion _foodPortionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodPortion(
    portionName: reader.readStringOrNull(offsets[0]),
    portionSize: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _foodPortionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FoodPortionQueryFilter
    on QueryBuilder<FoodPortion, FoodPortion, QFilterCondition> {
  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portionName',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portionName',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portionName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'portionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'portionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'portionName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'portionName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionName',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'portionName',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'portionSize',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'portionSize',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionSizeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'portionSize',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionSizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'portionSize',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionSizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'portionSize',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      portionSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'portionSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FoodPortionQueryObject
    on QueryBuilder<FoodPortion, FoodPortion, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const NutritionalInfoSchema = Schema(
  name: r'NutritionalInfo',
  id: -3185159951176506044,
  properties: {
    r'averageValue': PropertySchema(
      id: 0,
      name: r'averageValue',
      type: IsarType.long,
    ),
    r'carbs': PropertySchema(
      id: 1,
      name: r'carbs',
      type: IsarType.double,
    ),
    r'fat': PropertySchema(
      id: 2,
      name: r'fat',
      type: IsarType.double,
    ),
    r'kcal': PropertySchema(
      id: 3,
      name: r'kcal',
      type: IsarType.double,
    ),
    r'protein': PropertySchema(
      id: 4,
      name: r'protein',
      type: IsarType.double,
    )
  },
  estimateSize: _nutritionalInfoEstimateSize,
  serialize: _nutritionalInfoSerialize,
  deserialize: _nutritionalInfoDeserialize,
  deserializeProp: _nutritionalInfoDeserializeProp,
);

int _nutritionalInfoEstimateSize(
  NutritionalInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _nutritionalInfoSerialize(
  NutritionalInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.averageValue);
  writer.writeDouble(offsets[1], object.carbs);
  writer.writeDouble(offsets[2], object.fat);
  writer.writeDouble(offsets[3], object.kcal);
  writer.writeDouble(offsets[4], object.protein);
}

NutritionalInfo _nutritionalInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = NutritionalInfo(
    averageValue: reader.readLongOrNull(offsets[0]),
    carbs: reader.readDoubleOrNull(offsets[1]),
    fat: reader.readDoubleOrNull(offsets[2]),
    kcal: reader.readDoubleOrNull(offsets[3]),
    protein: reader.readDoubleOrNull(offsets[4]),
  );
  return object;
}

P _nutritionalInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension NutritionalInfoQueryFilter
    on QueryBuilder<NutritionalInfo, NutritionalInfo, QFilterCondition> {
  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      averageValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'averageValue',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      averageValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'averageValue',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      averageValueEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'averageValue',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      averageValueGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'averageValue',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      averageValueLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'averageValue',
        value: value,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      averageValueBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'averageValue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      carbsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'carbs',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      carbsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'carbs',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      carbsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      carbsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      carbsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      carbsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      fatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fat',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      fatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fat',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      fatEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      fatGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      fatLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      fatBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      kcalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'kcal',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      kcalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'kcal',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      kcalEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kcal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      kcalGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kcal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      kcalLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kcal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      kcalBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kcal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      proteinIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'protein',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      proteinIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'protein',
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      proteinEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      proteinGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      proteinLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<NutritionalInfo, NutritionalInfo, QAfterFilterCondition>
      proteinBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension NutritionalInfoQueryObject
    on QueryBuilder<NutritionalInfo, NutritionalInfo, QFilterCondition> {}
