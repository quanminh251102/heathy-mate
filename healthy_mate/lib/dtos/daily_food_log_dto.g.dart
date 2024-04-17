// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_food_log_dto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyFoodLogCollection on Isar {
  IsarCollection<DailyFoodLog> get dailyFoodLogs => this.collection();
}

const DailyFoodLogSchema = CollectionSchema(
  name: r'DailyFoodLog',
  id: 7940753759370054277,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'lastDrinkTime': PropertySchema(
      id: 1,
      name: r'lastDrinkTime',
      type: IsarType.dateTime,
    ),
    r'totalKcal': PropertySchema(
      id: 2,
      name: r'totalKcal',
      type: IsarType.double,
    ),
    r'userId': PropertySchema(
      id: 3,
      name: r'userId',
      type: IsarType.string,
    ),
    r'waterIntake': PropertySchema(
      id: 4,
      name: r'waterIntake',
      type: IsarType.long,
    )
  },
  estimateSize: _dailyFoodLogEstimateSize,
  serialize: _dailyFoodLogSerialize,
  deserialize: _dailyFoodLogDeserialize,
  deserializeProp: _dailyFoodLogDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'listMeal': LinkSchema(
      id: -629372274568019957,
      name: r'listMeal',
      target: r'MealDto',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _dailyFoodLogGetId,
  getLinks: _dailyFoodLogGetLinks,
  attach: _dailyFoodLogAttach,
  version: '3.1.0+1',
);

int _dailyFoodLogEstimateSize(
  DailyFoodLog object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _dailyFoodLogSerialize(
  DailyFoodLog object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeDateTime(offsets[1], object.lastDrinkTime);
  writer.writeDouble(offsets[2], object.totalKcal);
  writer.writeString(offsets[3], object.userId);
  writer.writeLong(offsets[4], object.waterIntake);
}

DailyFoodLog _dailyFoodLogDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyFoodLog(
    date: reader.readDateTimeOrNull(offsets[0]),
    id: id,
    lastDrinkTime: reader.readDateTimeOrNull(offsets[1]),
    totalKcal: reader.readDoubleOrNull(offsets[2]) ?? 0,
    userId: reader.readStringOrNull(offsets[3]),
    waterIntake: reader.readLongOrNull(offsets[4]),
  );
  return object;
}

P _dailyFoodLogDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset) ?? 0) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyFoodLogGetId(DailyFoodLog object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _dailyFoodLogGetLinks(DailyFoodLog object) {
  return [object.listMeal];
}

void _dailyFoodLogAttach(
    IsarCollection<dynamic> col, Id id, DailyFoodLog object) {
  object.id = id;
  object.listMeal.attach(col, col.isar.collection<MealDto>(), r'listMeal', id);
}

extension DailyFoodLogQueryWhereSort
    on QueryBuilder<DailyFoodLog, DailyFoodLog, QWhere> {
  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyFoodLogQueryWhere
    on QueryBuilder<DailyFoodLog, DailyFoodLog, QWhereClause> {
  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterWhereClause> idBetween(
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

extension DailyFoodLogQueryFilter
    on QueryBuilder<DailyFoodLog, DailyFoodLog, QFilterCondition> {
  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> dateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      dateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> dateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> dateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      lastDrinkTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastDrinkTime',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      lastDrinkTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastDrinkTime',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      lastDrinkTimeEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastDrinkTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      lastDrinkTimeGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastDrinkTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      lastDrinkTimeLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastDrinkTime',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      lastDrinkTimeBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastDrinkTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      totalKcalEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalKcal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      totalKcalGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalKcal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      totalKcalLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalKcal',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      totalKcalBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalKcal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      userIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> userIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      waterIntakeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'waterIntake',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      waterIntakeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'waterIntake',
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      waterIntakeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waterIntake',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      waterIntakeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waterIntake',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      waterIntakeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waterIntake',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      waterIntakeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waterIntake',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyFoodLogQueryObject
    on QueryBuilder<DailyFoodLog, DailyFoodLog, QFilterCondition> {}

extension DailyFoodLogQueryLinks
    on QueryBuilder<DailyFoodLog, DailyFoodLog, QFilterCondition> {
  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition> listMeal(
      FilterQuery<MealDto> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'listMeal');
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      listMealLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'listMeal', length, true, length, true);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      listMealIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'listMeal', 0, true, 0, true);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      listMealIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'listMeal', 0, false, 999999, true);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      listMealLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'listMeal', 0, true, length, include);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      listMealLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'listMeal', length, include, 999999, true);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterFilterCondition>
      listMealLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'listMeal', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DailyFoodLogQuerySortBy
    on QueryBuilder<DailyFoodLog, DailyFoodLog, QSortBy> {
  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> sortByLastDrinkTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDrinkTime', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy>
      sortByLastDrinkTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDrinkTime', Sort.desc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> sortByTotalKcal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKcal', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> sortByTotalKcalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKcal', Sort.desc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> sortByWaterIntake() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterIntake', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy>
      sortByWaterIntakeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterIntake', Sort.desc);
    });
  }
}

extension DailyFoodLogQuerySortThenBy
    on QueryBuilder<DailyFoodLog, DailyFoodLog, QSortThenBy> {
  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenByLastDrinkTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDrinkTime', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy>
      thenByLastDrinkTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastDrinkTime', Sort.desc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenByTotalKcal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKcal', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenByTotalKcalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalKcal', Sort.desc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy> thenByWaterIntake() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterIntake', Sort.asc);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QAfterSortBy>
      thenByWaterIntakeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waterIntake', Sort.desc);
    });
  }
}

extension DailyFoodLogQueryWhereDistinct
    on QueryBuilder<DailyFoodLog, DailyFoodLog, QDistinct> {
  QueryBuilder<DailyFoodLog, DailyFoodLog, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QDistinct>
      distinctByLastDrinkTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastDrinkTime');
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QDistinct> distinctByTotalKcal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalKcal');
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyFoodLog, DailyFoodLog, QDistinct> distinctByWaterIntake() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waterIntake');
    });
  }
}

extension DailyFoodLogQueryProperty
    on QueryBuilder<DailyFoodLog, DailyFoodLog, QQueryProperty> {
  QueryBuilder<DailyFoodLog, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyFoodLog, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DailyFoodLog, DateTime?, QQueryOperations>
      lastDrinkTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastDrinkTime');
    });
  }

  QueryBuilder<DailyFoodLog, double, QQueryOperations> totalKcalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalKcal');
    });
  }

  QueryBuilder<DailyFoodLog, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<DailyFoodLog, int?, QQueryOperations> waterIntakeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waterIntake');
    });
  }
}
