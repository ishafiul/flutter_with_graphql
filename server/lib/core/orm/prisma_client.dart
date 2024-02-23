// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:json_annotation/json_annotation.dart';
import 'package:orm/binary_engine.dart' as _i5;
import 'package:orm/engine_core.dart' as _i3;
import 'package:orm/graphql.dart' as _i2;
import 'package:orm/logger.dart' as _i4;
import 'package:orm/orm.dart' as _i1;
import 'package:orm/orm.dart' show DateTimeJsonConverter;

part 'prisma_client.g.dart';

enum UserScalarFieldEnum implements _i1.PrismaEnum {
  id,
  email,
  password;

  @override
  String? get originalName => null;
}

enum TodoScalarFieldEnum implements _i1.PrismaEnum {
  id,
  title,
  completed,
  userId;

  @override
  String? get originalName => null;
}

enum SortOrder implements _i1.PrismaEnum {
  asc,
  desc;

  @override
  String? get originalName => null;
}

enum QueryMode implements _i1.PrismaEnum {
  @JsonValue('default')
  $default(r'default'),
  insensitive;

  const QueryMode([this.originalName]);

  @override
  final String? originalName;
}

@_i1.jsonSerializable
class UserWhereInput implements _i1.JsonSerializable {
  const UserWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.email,
    this.password,
    this.todo,
  });

  factory UserWhereInput.fromJson(Map<String, dynamic> json) =>
      _$UserWhereInputFromJson(json);

  final Iterable<UserWhereInput>? AND;

  final Iterable<UserWhereInput>? OR;

  final Iterable<UserWhereInput>? NOT;

  final IntFilter? id;

  final StringFilter? email;

  final StringFilter? password;

  @JsonKey(name: r'Todo')
  final TodoListRelationFilter? todo;

  @override
  Map<String, dynamic> toJson() => _$UserWhereInputToJson(this);
}

@_i1.jsonSerializable
class UserOrderByWithRelationInput implements _i1.JsonSerializable {
  const UserOrderByWithRelationInput({
    this.id,
    this.email,
    this.password,
    this.todo,
  });

  factory UserOrderByWithRelationInput.fromJson(Map<String, dynamic> json) =>
      _$UserOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? email;

  final SortOrder? password;

  @JsonKey(name: r'Todo')
  final TodoOrderByRelationAggregateInput? todo;

  @override
  Map<String, dynamic> toJson() => _$UserOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class UserWhereUniqueInput implements _i1.JsonSerializable {
  const UserWhereUniqueInput({
    this.id,
    this.email,
  });

  factory UserWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$UserWhereUniqueInputFromJson(json);

  final int? id;

  final String? email;

  @override
  Map<String, dynamic> toJson() => _$UserWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class UserOrderByWithAggregationInput implements _i1.JsonSerializable {
  const UserOrderByWithAggregationInput({
    this.id,
    this.email,
    this.password,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory UserOrderByWithAggregationInput.fromJson(Map<String, dynamic> json) =>
      _$UserOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? email;

  final SortOrder? password;

  @JsonKey(name: r'_count')
  final UserCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final UserAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final UserMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final UserMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final UserSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$UserOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class UserScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const UserScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.email,
    this.password,
  });

  factory UserScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<UserScalarWhereWithAggregatesInput>? AND;

  final Iterable<UserScalarWhereWithAggregatesInput>? OR;

  final Iterable<UserScalarWhereWithAggregatesInput>? NOT;

  final IntWithAggregatesFilter? id;

  final StringWithAggregatesFilter? email;

  final StringWithAggregatesFilter? password;

  @override
  Map<String, dynamic> toJson() =>
      _$UserScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class TodoWhereInput implements _i1.JsonSerializable {
  const TodoWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.completed,
    this.userId,
    this.user,
  });

  factory TodoWhereInput.fromJson(Map<String, dynamic> json) =>
      _$TodoWhereInputFromJson(json);

  final Iterable<TodoWhereInput>? AND;

  final Iterable<TodoWhereInput>? OR;

  final Iterable<TodoWhereInput>? NOT;

  final IntFilter? id;

  final StringFilter? title;

  final BoolFilter? completed;

  final IntFilter? userId;

  final UserRelationFilter? user;

  @override
  Map<String, dynamic> toJson() => _$TodoWhereInputToJson(this);
}

@_i1.jsonSerializable
class TodoOrderByWithRelationInput implements _i1.JsonSerializable {
  const TodoOrderByWithRelationInput({
    this.id,
    this.title,
    this.completed,
    this.userId,
    this.user,
  });

  factory TodoOrderByWithRelationInput.fromJson(Map<String, dynamic> json) =>
      _$TodoOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? completed;

  final SortOrder? userId;

  final UserOrderByWithRelationInput? user;

  @override
  Map<String, dynamic> toJson() => _$TodoOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class TodoWhereUniqueInput implements _i1.JsonSerializable {
  const TodoWhereUniqueInput({this.id});

  factory TodoWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$TodoWhereUniqueInputFromJson(json);

  final int? id;

  @override
  Map<String, dynamic> toJson() => _$TodoWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class TodoOrderByWithAggregationInput implements _i1.JsonSerializable {
  const TodoOrderByWithAggregationInput({
    this.id,
    this.title,
    this.completed,
    this.userId,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory TodoOrderByWithAggregationInput.fromJson(Map<String, dynamic> json) =>
      _$TodoOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? completed;

  final SortOrder? userId;

  @JsonKey(name: r'_count')
  final TodoCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final TodoAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final TodoMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final TodoMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final TodoSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class TodoScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const TodoScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.completed,
    this.userId,
  });

  factory TodoScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<TodoScalarWhereWithAggregatesInput>? AND;

  final Iterable<TodoScalarWhereWithAggregatesInput>? OR;

  final Iterable<TodoScalarWhereWithAggregatesInput>? NOT;

  final IntWithAggregatesFilter? id;

  final StringWithAggregatesFilter? title;

  final BoolWithAggregatesFilter? completed;

  final IntWithAggregatesFilter? userId;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateInput implements _i1.JsonSerializable {
  const UserCreateInput({
    required this.email,
    required this.password,
    this.todo,
  });

  factory UserCreateInput.fromJson(Map<String, dynamic> json) =>
      _$UserCreateInputFromJson(json);

  final String email;

  final String password;

  @JsonKey(name: r'Todo')
  final TodoCreateNestedManyWithoutUserInput? todo;

  @override
  Map<String, dynamic> toJson() => _$UserCreateInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedCreateInput implements _i1.JsonSerializable {
  const UserUncheckedCreateInput({
    this.id,
    required this.email,
    required this.password,
    this.todo,
  });

  factory UserUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$UserUncheckedCreateInputFromJson(json);

  final int? id;

  final String email;

  final String password;

  @JsonKey(name: r'Todo')
  final TodoUncheckedCreateNestedManyWithoutUserInput? todo;

  @override
  Map<String, dynamic> toJson() => _$UserUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class UserUpdateInput implements _i1.JsonSerializable {
  const UserUpdateInput({
    this.email,
    this.password,
    this.todo,
  });

  factory UserUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateInputFromJson(json);

  final StringFieldUpdateOperationsInput? email;

  final StringFieldUpdateOperationsInput? password;

  @JsonKey(name: r'Todo')
  final TodoUpdateManyWithoutUserNestedInput? todo;

  @override
  Map<String, dynamic> toJson() => _$UserUpdateInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedUpdateInput implements _i1.JsonSerializable {
  const UserUncheckedUpdateInput({
    this.id,
    this.email,
    this.password,
    this.todo,
  });

  factory UserUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$UserUncheckedUpdateInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? email;

  final StringFieldUpdateOperationsInput? password;

  @JsonKey(name: r'Todo')
  final TodoUncheckedUpdateManyWithoutUserNestedInput? todo;

  @override
  Map<String, dynamic> toJson() => _$UserUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateManyInput implements _i1.JsonSerializable {
  const UserCreateManyInput({
    this.id,
    required this.email,
    required this.password,
  });

  factory UserCreateManyInput.fromJson(Map<String, dynamic> json) =>
      _$UserCreateManyInputFromJson(json);

  final int? id;

  final String email;

  final String password;

  @override
  Map<String, dynamic> toJson() => _$UserCreateManyInputToJson(this);
}

@_i1.jsonSerializable
class UserUpdateManyMutationInput implements _i1.JsonSerializable {
  const UserUpdateManyMutationInput({
    this.email,
    this.password,
  });

  factory UserUpdateManyMutationInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateManyMutationInputFromJson(json);

  final StringFieldUpdateOperationsInput? email;

  final StringFieldUpdateOperationsInput? password;

  @override
  Map<String, dynamic> toJson() => _$UserUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const UserUncheckedUpdateManyInput({
    this.id,
    this.email,
    this.password,
  });

  factory UserUncheckedUpdateManyInput.fromJson(Map<String, dynamic> json) =>
      _$UserUncheckedUpdateManyInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? email;

  final StringFieldUpdateOperationsInput? password;

  @override
  Map<String, dynamic> toJson() => _$UserUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class TodoCreateInput implements _i1.JsonSerializable {
  const TodoCreateInput({
    required this.title,
    this.completed,
    required this.user,
  });

  factory TodoCreateInput.fromJson(Map<String, dynamic> json) =>
      _$TodoCreateInputFromJson(json);

  final String title;

  final bool? completed;

  final UserCreateNestedOneWithoutTodoInput user;

  @override
  Map<String, dynamic> toJson() => _$TodoCreateInputToJson(this);
}

@_i1.jsonSerializable
class TodoUncheckedCreateInput implements _i1.JsonSerializable {
  const TodoUncheckedCreateInput({
    this.id,
    required this.title,
    this.completed,
    required this.userId,
  });

  factory TodoUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$TodoUncheckedCreateInputFromJson(json);

  final int? id;

  final String title;

  final bool? completed;

  final int userId;

  @override
  Map<String, dynamic> toJson() => _$TodoUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class TodoUpdateInput implements _i1.JsonSerializable {
  const TodoUpdateInput({
    this.title,
    this.completed,
    this.user,
  });

  factory TodoUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$TodoUpdateInputFromJson(json);

  final StringFieldUpdateOperationsInput? title;

  final BoolFieldUpdateOperationsInput? completed;

  final UserUpdateOneRequiredWithoutTodoNestedInput? user;

  @override
  Map<String, dynamic> toJson() => _$TodoUpdateInputToJson(this);
}

@_i1.jsonSerializable
class TodoUncheckedUpdateInput implements _i1.JsonSerializable {
  const TodoUncheckedUpdateInput({
    this.id,
    this.title,
    this.completed,
    this.userId,
  });

  factory TodoUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$TodoUncheckedUpdateInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? title;

  final BoolFieldUpdateOperationsInput? completed;

  final IntFieldUpdateOperationsInput? userId;

  @override
  Map<String, dynamic> toJson() => _$TodoUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class TodoCreateManyInput implements _i1.JsonSerializable {
  const TodoCreateManyInput({
    this.id,
    required this.title,
    this.completed,
    required this.userId,
  });

  factory TodoCreateManyInput.fromJson(Map<String, dynamic> json) =>
      _$TodoCreateManyInputFromJson(json);

  final int? id;

  final String title;

  final bool? completed;

  final int userId;

  @override
  Map<String, dynamic> toJson() => _$TodoCreateManyInputToJson(this);
}

@_i1.jsonSerializable
class TodoUpdateManyMutationInput implements _i1.JsonSerializable {
  const TodoUpdateManyMutationInput({
    this.title,
    this.completed,
  });

  factory TodoUpdateManyMutationInput.fromJson(Map<String, dynamic> json) =>
      _$TodoUpdateManyMutationInputFromJson(json);

  final StringFieldUpdateOperationsInput? title;

  final BoolFieldUpdateOperationsInput? completed;

  @override
  Map<String, dynamic> toJson() => _$TodoUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class TodoUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const TodoUncheckedUpdateManyInput({
    this.id,
    this.title,
    this.completed,
    this.userId,
  });

  factory TodoUncheckedUpdateManyInput.fromJson(Map<String, dynamic> json) =>
      _$TodoUncheckedUpdateManyInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? title;

  final BoolFieldUpdateOperationsInput? completed;

  final IntFieldUpdateOperationsInput? userId;

  @override
  Map<String, dynamic> toJson() => _$TodoUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class IntFilter implements _i1.JsonSerializable {
  const IntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory IntFilter.fromJson(Map<String, dynamic> json) =>
      _$IntFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$IntFilterToJson(this);
}

@_i1.jsonSerializable
class StringFilter implements _i1.JsonSerializable {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
  });

  factory StringFilter.fromJson(Map<String, dynamic> json) =>
      _$StringFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final QueryMode? mode;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$StringFilterToJson(this);
}

@_i1.jsonSerializable
class TodoListRelationFilter implements _i1.JsonSerializable {
  const TodoListRelationFilter({
    this.every,
    this.some,
    this.none,
  });

  factory TodoListRelationFilter.fromJson(Map<String, dynamic> json) =>
      _$TodoListRelationFilterFromJson(json);

  final TodoWhereInput? every;

  final TodoWhereInput? some;

  final TodoWhereInput? none;

  @override
  Map<String, dynamic> toJson() => _$TodoListRelationFilterToJson(this);
}

@_i1.jsonSerializable
class TodoOrderByRelationAggregateInput implements _i1.JsonSerializable {
  const TodoOrderByRelationAggregateInput({this.$count});

  factory TodoOrderByRelationAggregateInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoOrderByRelationAggregateInputFromJson(json);

  @JsonKey(name: r'_count')
  final SortOrder? $count;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoOrderByRelationAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserCountOrderByAggregateInput implements _i1.JsonSerializable {
  const UserCountOrderByAggregateInput({
    this.id,
    this.email,
    this.password,
  });

  factory UserCountOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? email;

  final SortOrder? password;

  @override
  Map<String, dynamic> toJson() => _$UserCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const UserAvgOrderByAggregateInput({this.id});

  factory UserAvgOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() => _$UserAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const UserMaxOrderByAggregateInput({
    this.id,
    this.email,
    this.password,
  });

  factory UserMaxOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? email;

  final SortOrder? password;

  @override
  Map<String, dynamic> toJson() => _$UserMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserMinOrderByAggregateInput implements _i1.JsonSerializable {
  const UserMinOrderByAggregateInput({
    this.id,
    this.email,
    this.password,
  });

  factory UserMinOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? email;

  final SortOrder? password;

  @override
  Map<String, dynamic> toJson() => _$UserMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserSumOrderByAggregateInput implements _i1.JsonSerializable {
  const UserSumOrderByAggregateInput({this.id});

  factory UserSumOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() => _$UserSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class IntWithAggregatesFilter implements _i1.JsonSerializable {
  const IntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory IntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$IntWithAggregatesFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$IntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class StringWithAggregatesFilter implements _i1.JsonSerializable {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory StringWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$StringWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final QueryMode? mode;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$StringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class BoolFilter implements _i1.JsonSerializable {
  const BoolFilter({
    this.equals,
    this.not,
  });

  factory BoolFilter.fromJson(Map<String, dynamic> json) =>
      _$BoolFilterFromJson(json);

  final bool? equals;

  final NestedBoolFilter? not;

  @override
  Map<String, dynamic> toJson() => _$BoolFilterToJson(this);
}

@_i1.jsonSerializable
class UserRelationFilter implements _i1.JsonSerializable {
  const UserRelationFilter({
    this.$is,
    this.isNot,
  });

  factory UserRelationFilter.fromJson(Map<String, dynamic> json) =>
      _$UserRelationFilterFromJson(json);

  @JsonKey(name: r'is')
  final UserWhereInput? $is;

  final UserWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => _$UserRelationFilterToJson(this);
}

@_i1.jsonSerializable
class TodoCountOrderByAggregateInput implements _i1.JsonSerializable {
  const TodoCountOrderByAggregateInput({
    this.id,
    this.title,
    this.completed,
    this.userId,
  });

  factory TodoCountOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$TodoCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? completed;

  final SortOrder? userId;

  @override
  Map<String, dynamic> toJson() => _$TodoCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class TodoAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const TodoAvgOrderByAggregateInput({
    this.id,
    this.userId,
  });

  factory TodoAvgOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$TodoAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? userId;

  @override
  Map<String, dynamic> toJson() => _$TodoAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class TodoMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const TodoMaxOrderByAggregateInput({
    this.id,
    this.title,
    this.completed,
    this.userId,
  });

  factory TodoMaxOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$TodoMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? completed;

  final SortOrder? userId;

  @override
  Map<String, dynamic> toJson() => _$TodoMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class TodoMinOrderByAggregateInput implements _i1.JsonSerializable {
  const TodoMinOrderByAggregateInput({
    this.id,
    this.title,
    this.completed,
    this.userId,
  });

  factory TodoMinOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$TodoMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? title;

  final SortOrder? completed;

  final SortOrder? userId;

  @override
  Map<String, dynamic> toJson() => _$TodoMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class TodoSumOrderByAggregateInput implements _i1.JsonSerializable {
  const TodoSumOrderByAggregateInput({
    this.id,
    this.userId,
  });

  factory TodoSumOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$TodoSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  final SortOrder? userId;

  @override
  Map<String, dynamic> toJson() => _$TodoSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class BoolWithAggregatesFilter implements _i1.JsonSerializable {
  const BoolWithAggregatesFilter({
    this.equals,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory BoolWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$BoolWithAggregatesFilterFromJson(json);

  final bool? equals;

  final NestedBoolWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedBoolFilter? $min;

  @JsonKey(name: r'_max')
  final NestedBoolFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$BoolWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class TodoCreateNestedManyWithoutUserInput implements _i1.JsonSerializable {
  const TodoCreateNestedManyWithoutUserInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  factory TodoCreateNestedManyWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoCreateNestedManyWithoutUserInputFromJson(json);

  final Iterable<TodoCreateWithoutUserInput>? create;

  final Iterable<TodoCreateOrConnectWithoutUserInput>? connectOrCreate;

  final TodoCreateManyUserInputEnvelope? createMany;

  final Iterable<TodoWhereUniqueInput>? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoCreateNestedManyWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoUncheckedCreateNestedManyWithoutUserInput
    implements _i1.JsonSerializable {
  const TodoUncheckedCreateNestedManyWithoutUserInput({
    this.create,
    this.connectOrCreate,
    this.createMany,
    this.connect,
  });

  factory TodoUncheckedCreateNestedManyWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoUncheckedCreateNestedManyWithoutUserInputFromJson(json);

  final Iterable<TodoCreateWithoutUserInput>? create;

  final Iterable<TodoCreateOrConnectWithoutUserInput>? connectOrCreate;

  final TodoCreateManyUserInputEnvelope? createMany;

  final Iterable<TodoWhereUniqueInput>? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoUncheckedCreateNestedManyWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class StringFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const StringFieldUpdateOperationsInput({this.set});

  factory StringFieldUpdateOperationsInput.fromJson(
          Map<String, dynamic> json) =>
      _$StringFieldUpdateOperationsInputFromJson(json);

  final String? set;

  @override
  Map<String, dynamic> toJson() =>
      _$StringFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class TodoUpdateManyWithoutUserNestedInput implements _i1.JsonSerializable {
  const TodoUpdateManyWithoutUserNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  factory TodoUpdateManyWithoutUserNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoUpdateManyWithoutUserNestedInputFromJson(json);

  final Iterable<TodoCreateWithoutUserInput>? create;

  final Iterable<TodoCreateOrConnectWithoutUserInput>? connectOrCreate;

  final Iterable<TodoUpsertWithWhereUniqueWithoutUserInput>? upsert;

  final TodoCreateManyUserInputEnvelope? createMany;

  final Iterable<TodoWhereUniqueInput>? set;

  final Iterable<TodoWhereUniqueInput>? disconnect;

  final Iterable<TodoWhereUniqueInput>? delete;

  final Iterable<TodoWhereUniqueInput>? connect;

  final Iterable<TodoUpdateWithWhereUniqueWithoutUserInput>? update;

  final Iterable<TodoUpdateManyWithWhereWithoutUserInput>? updateMany;

  final Iterable<TodoScalarWhereInput>? deleteMany;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoUpdateManyWithoutUserNestedInputToJson(this);
}

@_i1.jsonSerializable
class IntFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const IntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  factory IntFieldUpdateOperationsInput.fromJson(Map<String, dynamic> json) =>
      _$IntFieldUpdateOperationsInputFromJson(json);

  final int? set;

  final int? increment;

  final int? decrement;

  final int? multiply;

  final int? divide;

  @override
  Map<String, dynamic> toJson() => _$IntFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class TodoUncheckedUpdateManyWithoutUserNestedInput
    implements _i1.JsonSerializable {
  const TodoUncheckedUpdateManyWithoutUserNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.createMany,
    this.set,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
    this.updateMany,
    this.deleteMany,
  });

  factory TodoUncheckedUpdateManyWithoutUserNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoUncheckedUpdateManyWithoutUserNestedInputFromJson(json);

  final Iterable<TodoCreateWithoutUserInput>? create;

  final Iterable<TodoCreateOrConnectWithoutUserInput>? connectOrCreate;

  final Iterable<TodoUpsertWithWhereUniqueWithoutUserInput>? upsert;

  final TodoCreateManyUserInputEnvelope? createMany;

  final Iterable<TodoWhereUniqueInput>? set;

  final Iterable<TodoWhereUniqueInput>? disconnect;

  final Iterable<TodoWhereUniqueInput>? delete;

  final Iterable<TodoWhereUniqueInput>? connect;

  final Iterable<TodoUpdateWithWhereUniqueWithoutUserInput>? update;

  final Iterable<TodoUpdateManyWithWhereWithoutUserInput>? updateMany;

  final Iterable<TodoScalarWhereInput>? deleteMany;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoUncheckedUpdateManyWithoutUserNestedInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateNestedOneWithoutTodoInput implements _i1.JsonSerializable {
  const UserCreateNestedOneWithoutTodoInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory UserCreateNestedOneWithoutTodoInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserCreateNestedOneWithoutTodoInputFromJson(json);

  final UserCreateWithoutTodoInput? create;

  final UserCreateOrConnectWithoutTodoInput? connectOrCreate;

  final UserWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$UserCreateNestedOneWithoutTodoInputToJson(this);
}

@_i1.jsonSerializable
class BoolFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const BoolFieldUpdateOperationsInput({this.set});

  factory BoolFieldUpdateOperationsInput.fromJson(Map<String, dynamic> json) =>
      _$BoolFieldUpdateOperationsInputFromJson(json);

  final bool? set;

  @override
  Map<String, dynamic> toJson() => _$BoolFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class UserUpdateOneRequiredWithoutTodoNestedInput
    implements _i1.JsonSerializable {
  const UserUpdateOneRequiredWithoutTodoNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  factory UserUpdateOneRequiredWithoutTodoNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserUpdateOneRequiredWithoutTodoNestedInputFromJson(json);

  final UserCreateWithoutTodoInput? create;

  final UserCreateOrConnectWithoutTodoInput? connectOrCreate;

  final UserUpsertWithoutTodoInput? upsert;

  final UserWhereUniqueInput? connect;

  final UserUpdateWithoutTodoInput? update;

  @override
  Map<String, dynamic> toJson() =>
      _$UserUpdateOneRequiredWithoutTodoNestedInputToJson(this);
}

@_i1.jsonSerializable
class NestedIntFilter implements _i1.JsonSerializable {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedIntFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedIntFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringFilter implements _i1.JsonSerializable {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory NestedStringFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedStringFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedStringFilterToJson(this);
}

@_i1.jsonSerializable
class NestedIntWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory NestedIntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntWithAggregatesFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$NestedIntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedFloatFilter implements _i1.JsonSerializable {
  const NestedFloatFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedFloatFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedFloatFilterFromJson(json);

  final double? equals;

  @JsonKey(name: r'in')
  final Iterable<double>? $in;

  final Iterable<double>? notIn;

  final double? lt;

  final double? lte;

  final double? gt;

  final double? gte;

  final NestedFloatFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedFloatFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory NestedStringWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$NestedStringWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$NestedStringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedBoolFilter implements _i1.JsonSerializable {
  const NestedBoolFilter({
    this.equals,
    this.not,
  });

  factory NestedBoolFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedBoolFilterFromJson(json);

  final bool? equals;

  final NestedBoolFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedBoolFilterToJson(this);
}

@_i1.jsonSerializable
class NestedBoolWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedBoolWithAggregatesFilter({
    this.equals,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory NestedBoolWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedBoolWithAggregatesFilterFromJson(json);

  final bool? equals;

  final NestedBoolWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedBoolFilter? $min;

  @JsonKey(name: r'_max')
  final NestedBoolFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$NestedBoolWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class TodoCreateWithoutUserInput implements _i1.JsonSerializable {
  const TodoCreateWithoutUserInput({
    required this.title,
    this.completed,
  });

  factory TodoCreateWithoutUserInput.fromJson(Map<String, dynamic> json) =>
      _$TodoCreateWithoutUserInputFromJson(json);

  final String title;

  final bool? completed;

  @override
  Map<String, dynamic> toJson() => _$TodoCreateWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoUncheckedCreateWithoutUserInput implements _i1.JsonSerializable {
  const TodoUncheckedCreateWithoutUserInput({
    this.id,
    required this.title,
    this.completed,
  });

  factory TodoUncheckedCreateWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoUncheckedCreateWithoutUserInputFromJson(json);

  final int? id;

  final String title;

  final bool? completed;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoUncheckedCreateWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoCreateOrConnectWithoutUserInput implements _i1.JsonSerializable {
  const TodoCreateOrConnectWithoutUserInput({
    required this.where,
    required this.create,
  });

  factory TodoCreateOrConnectWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoCreateOrConnectWithoutUserInputFromJson(json);

  final TodoWhereUniqueInput where;

  final TodoCreateWithoutUserInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoCreateOrConnectWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoCreateManyUserInputEnvelope implements _i1.JsonSerializable {
  const TodoCreateManyUserInputEnvelope({
    required this.data,
    this.skipDuplicates,
  });

  factory TodoCreateManyUserInputEnvelope.fromJson(Map<String, dynamic> json) =>
      _$TodoCreateManyUserInputEnvelopeFromJson(json);

  final Iterable<TodoCreateManyUserInput> data;

  final bool? skipDuplicates;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoCreateManyUserInputEnvelopeToJson(this);
}

@_i1.jsonSerializable
class TodoUpsertWithWhereUniqueWithoutUserInput
    implements _i1.JsonSerializable {
  const TodoUpsertWithWhereUniqueWithoutUserInput({
    required this.where,
    required this.update,
    required this.create,
  });

  factory TodoUpsertWithWhereUniqueWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoUpsertWithWhereUniqueWithoutUserInputFromJson(json);

  final TodoWhereUniqueInput where;

  final TodoUpdateWithoutUserInput update;

  final TodoCreateWithoutUserInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoUpsertWithWhereUniqueWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoUpdateWithWhereUniqueWithoutUserInput
    implements _i1.JsonSerializable {
  const TodoUpdateWithWhereUniqueWithoutUserInput({
    required this.where,
    required this.data,
  });

  factory TodoUpdateWithWhereUniqueWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoUpdateWithWhereUniqueWithoutUserInputFromJson(json);

  final TodoWhereUniqueInput where;

  final TodoUpdateWithoutUserInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoUpdateWithWhereUniqueWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoUpdateManyWithWhereWithoutUserInput implements _i1.JsonSerializable {
  const TodoUpdateManyWithWhereWithoutUserInput({
    required this.where,
    required this.data,
  });

  factory TodoUpdateManyWithWhereWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoUpdateManyWithWhereWithoutUserInputFromJson(json);

  final TodoScalarWhereInput where;

  final TodoUpdateManyMutationInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoUpdateManyWithWhereWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoScalarWhereInput implements _i1.JsonSerializable {
  const TodoScalarWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.title,
    this.completed,
    this.userId,
  });

  factory TodoScalarWhereInput.fromJson(Map<String, dynamic> json) =>
      _$TodoScalarWhereInputFromJson(json);

  final Iterable<TodoScalarWhereInput>? AND;

  final Iterable<TodoScalarWhereInput>? OR;

  final Iterable<TodoScalarWhereInput>? NOT;

  final IntFilter? id;

  final StringFilter? title;

  final BoolFilter? completed;

  final IntFilter? userId;

  @override
  Map<String, dynamic> toJson() => _$TodoScalarWhereInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateWithoutTodoInput implements _i1.JsonSerializable {
  const UserCreateWithoutTodoInput({
    required this.email,
    required this.password,
  });

  factory UserCreateWithoutTodoInput.fromJson(Map<String, dynamic> json) =>
      _$UserCreateWithoutTodoInputFromJson(json);

  final String email;

  final String password;

  @override
  Map<String, dynamic> toJson() => _$UserCreateWithoutTodoInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedCreateWithoutTodoInput implements _i1.JsonSerializable {
  const UserUncheckedCreateWithoutTodoInput({
    this.id,
    required this.email,
    required this.password,
  });

  factory UserUncheckedCreateWithoutTodoInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserUncheckedCreateWithoutTodoInputFromJson(json);

  final int? id;

  final String email;

  final String password;

  @override
  Map<String, dynamic> toJson() =>
      _$UserUncheckedCreateWithoutTodoInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateOrConnectWithoutTodoInput implements _i1.JsonSerializable {
  const UserCreateOrConnectWithoutTodoInput({
    required this.where,
    required this.create,
  });

  factory UserCreateOrConnectWithoutTodoInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserCreateOrConnectWithoutTodoInputFromJson(json);

  final UserWhereUniqueInput where;

  final UserCreateWithoutTodoInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$UserCreateOrConnectWithoutTodoInputToJson(this);
}

@_i1.jsonSerializable
class UserUpsertWithoutTodoInput implements _i1.JsonSerializable {
  const UserUpsertWithoutTodoInput({
    required this.update,
    required this.create,
  });

  factory UserUpsertWithoutTodoInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpsertWithoutTodoInputFromJson(json);

  final UserUpdateWithoutTodoInput update;

  final UserCreateWithoutTodoInput create;

  @override
  Map<String, dynamic> toJson() => _$UserUpsertWithoutTodoInputToJson(this);
}

@_i1.jsonSerializable
class UserUpdateWithoutTodoInput implements _i1.JsonSerializable {
  const UserUpdateWithoutTodoInput({
    this.email,
    this.password,
  });

  factory UserUpdateWithoutTodoInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateWithoutTodoInputFromJson(json);

  final StringFieldUpdateOperationsInput? email;

  final StringFieldUpdateOperationsInput? password;

  @override
  Map<String, dynamic> toJson() => _$UserUpdateWithoutTodoInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedUpdateWithoutTodoInput implements _i1.JsonSerializable {
  const UserUncheckedUpdateWithoutTodoInput({
    this.id,
    this.email,
    this.password,
  });

  factory UserUncheckedUpdateWithoutTodoInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserUncheckedUpdateWithoutTodoInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? email;

  final StringFieldUpdateOperationsInput? password;

  @override
  Map<String, dynamic> toJson() =>
      _$UserUncheckedUpdateWithoutTodoInputToJson(this);
}

@_i1.jsonSerializable
class TodoCreateManyUserInput implements _i1.JsonSerializable {
  const TodoCreateManyUserInput({
    this.id,
    required this.title,
    this.completed,
  });

  factory TodoCreateManyUserInput.fromJson(Map<String, dynamic> json) =>
      _$TodoCreateManyUserInputFromJson(json);

  final int? id;

  final String title;

  final bool? completed;

  @override
  Map<String, dynamic> toJson() => _$TodoCreateManyUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoUpdateWithoutUserInput implements _i1.JsonSerializable {
  const TodoUpdateWithoutUserInput({
    this.title,
    this.completed,
  });

  factory TodoUpdateWithoutUserInput.fromJson(Map<String, dynamic> json) =>
      _$TodoUpdateWithoutUserInputFromJson(json);

  final StringFieldUpdateOperationsInput? title;

  final BoolFieldUpdateOperationsInput? completed;

  @override
  Map<String, dynamic> toJson() => _$TodoUpdateWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoUncheckedUpdateWithoutUserInput implements _i1.JsonSerializable {
  const TodoUncheckedUpdateWithoutUserInput({
    this.id,
    this.title,
    this.completed,
  });

  factory TodoUncheckedUpdateWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoUncheckedUpdateWithoutUserInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? title;

  final BoolFieldUpdateOperationsInput? completed;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoUncheckedUpdateWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class TodoUncheckedUpdateManyWithoutTodoInput implements _i1.JsonSerializable {
  const TodoUncheckedUpdateManyWithoutTodoInput({
    this.id,
    this.title,
    this.completed,
  });

  factory TodoUncheckedUpdateManyWithoutTodoInput.fromJson(
          Map<String, dynamic> json) =>
      _$TodoUncheckedUpdateManyWithoutTodoInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  final StringFieldUpdateOperationsInput? title;

  final BoolFieldUpdateOperationsInput? completed;

  @override
  Map<String, dynamic> toJson() =>
      _$TodoUncheckedUpdateManyWithoutTodoInputToJson(this);
}

@_i1.jsonSerializable
class User implements _i1.JsonSerializable {
  const User({
    required this.id,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final int id;

  final String email;

  final String password;

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@_i1.jsonSerializable
class Todo implements _i1.JsonSerializable {
  const Todo({
    required this.id,
    required this.title,
    required this.completed,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  final int id;

  final String title;

  final bool completed;

  final int userId;

  @override
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

class UserFluent<T> extends _i1.PrismaFluent<T> {
  const UserFluent(
    super.original,
    super.$query,
  );

  Future<Iterable<Todo>?> todo({
    TodoWhereInput? where,
    Iterable<TodoOrderByWithRelationInput>? orderBy,
    TodoWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<TodoScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'Todo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'Todo',
    );
    final fields = TodoScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> todo) =>
        todo.map((Map todo) => Todo.fromJson(todo.cast()));
    return query(fields)
        .then((json) => json is Iterable ? compiler(json.cast()) : null);
  }

  UserCountOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return UserCountOutputType(query);
  }
}

class TodoFluent<T> extends _i1.PrismaFluent<T> {
  const TodoFluent(
    super.original,
    super.$query,
  );

  UserFluent<User> user() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'user',
          fields: fields,
        )
      ]),
      key: r'user',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }
}

extension UserModelDelegateExtension on _i1.ModelDelegate<User> {
  UserFluent<User?> findUnique({required UserWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? User.fromJson(json.cast<String, dynamic>()) : null);
    return UserFluent<User?>(
      future,
      query,
    );
  }

  UserFluent<User> findUniqueOrThrow({required UserWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueUserOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueUserOrThrow',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }

  UserFluent<User?> findFirst({
    UserWhereInput? where,
    Iterable<UserOrderByWithRelationInput>? orderBy,
    UserWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<UserScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? User.fromJson(json.cast<String, dynamic>()) : null);
    return UserFluent<User?>(
      future,
      query,
    );
  }

  UserFluent<User> findFirstOrThrow({
    UserWhereInput? where,
    Iterable<UserOrderByWithRelationInput>? orderBy,
    UserWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<UserScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstUserOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstUserOrThrow',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }

  Future<Iterable<User>> findMany({
    UserWhereInput? where,
    Iterable<UserOrderByWithRelationInput>? orderBy,
    UserWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<UserScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyUser',
    );
    final fields = UserScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyUser) => findManyUser
        .map((Map findManyUser) => User.fromJson(findManyUser.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  UserFluent<User> create({required UserCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> createMany({
    required Iterable<UserCreateManyInput> data,
    bool? skipDuplicates,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'skipDuplicates',
        skipDuplicates,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createManyUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createManyUser',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map createManyUser) =>
        AffectedRowsOutput.fromJson(createManyUser.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  UserFluent<User?> update({
    required UserUpdateInput data,
    required UserWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? User.fromJson(json.cast<String, dynamic>()) : null);
    return UserFluent<User?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required UserUpdateManyMutationInput data,
    UserWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyUser',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyUser) =>
        AffectedRowsOutput.fromJson(updateManyUser.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  UserFluent<User> upsert({
    required UserWhereUniqueInput where,
    required UserCreateInput create,
    required UserUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }

  UserFluent<User?> delete({required UserWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? User.fromJson(json.cast<String, dynamic>()) : null);
    return UserFluent<User?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({UserWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyUser',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyUser) =>
        AffectedRowsOutput.fromJson(deleteManyUser.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateUser aggregate({
    UserWhereInput? where,
    Iterable<UserOrderByWithRelationInput>? orderBy,
    UserWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateUser',
    );
    return AggregateUser(query);
  }

  Future<Iterable<UserGroupByOutputType>> groupBy({
    UserWhereInput? where,
    Iterable<UserOrderByWithAggregationInput>? orderBy,
    required Iterable<UserScalarFieldEnum> by,
    UserScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByUser',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByUser) => groupByUser.map((Map groupByUser) =>
        UserGroupByOutputType.fromJson(groupByUser.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

extension TodoModelDelegateExtension on _i1.ModelDelegate<Todo> {
  TodoFluent<Todo?> findUnique({required TodoWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueTodo',
    );
    final future = query(TodoScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Todo.fromJson(json.cast<String, dynamic>()) : null);
    return TodoFluent<Todo?>(
      future,
      query,
    );
  }

  TodoFluent<Todo> findUniqueOrThrow({required TodoWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueTodoOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueTodoOrThrow',
    );
    final future = query(TodoScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Todo.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Todo)'));
    return TodoFluent<Todo>(
      future,
      query,
    );
  }

  TodoFluent<Todo?> findFirst({
    TodoWhereInput? where,
    Iterable<TodoOrderByWithRelationInput>? orderBy,
    TodoWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<TodoScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstTodo',
    );
    final future = query(TodoScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Todo.fromJson(json.cast<String, dynamic>()) : null);
    return TodoFluent<Todo?>(
      future,
      query,
    );
  }

  TodoFluent<Todo> findFirstOrThrow({
    TodoWhereInput? where,
    Iterable<TodoOrderByWithRelationInput>? orderBy,
    TodoWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<TodoScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstTodoOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstTodoOrThrow',
    );
    final future = query(TodoScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Todo.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Todo)'));
    return TodoFluent<Todo>(
      future,
      query,
    );
  }

  Future<Iterable<Todo>> findMany({
    TodoWhereInput? where,
    Iterable<TodoOrderByWithRelationInput>? orderBy,
    TodoWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<TodoScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyTodo',
    );
    final fields = TodoScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyTodo) => findManyTodo
        .map((Map findManyTodo) => Todo.fromJson(findManyTodo.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  TodoFluent<Todo> create({required TodoCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneTodo',
    );
    final future = query(TodoScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Todo.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Todo)'));
    return TodoFluent<Todo>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> createMany({
    required Iterable<TodoCreateManyInput> data,
    bool? skipDuplicates,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'skipDuplicates',
        skipDuplicates,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createManyTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createManyTodo',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map createManyTodo) =>
        AffectedRowsOutput.fromJson(createManyTodo.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  TodoFluent<Todo?> update({
    required TodoUpdateInput data,
    required TodoWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneTodo',
    );
    final future = query(TodoScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Todo.fromJson(json.cast<String, dynamic>()) : null);
    return TodoFluent<Todo?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required TodoUpdateManyMutationInput data,
    TodoWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyTodo',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyTodo) =>
        AffectedRowsOutput.fromJson(updateManyTodo.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  TodoFluent<Todo> upsert({
    required TodoWhereUniqueInput where,
    required TodoCreateInput create,
    required TodoUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneTodo',
    );
    final future = query(TodoScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Todo.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Todo)'));
    return TodoFluent<Todo>(
      future,
      query,
    );
  }

  TodoFluent<Todo?> delete({required TodoWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneTodo',
    );
    final future = query(TodoScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Todo.fromJson(json.cast<String, dynamic>()) : null);
    return TodoFluent<Todo?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({TodoWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyTodo',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyTodo) =>
        AffectedRowsOutput.fromJson(deleteManyTodo.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateTodo aggregate({
    TodoWhereInput? where,
    Iterable<TodoOrderByWithRelationInput>? orderBy,
    TodoWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateTodo',
    );
    return AggregateTodo(query);
  }

  Future<Iterable<TodoGroupByOutputType>> groupBy({
    TodoWhereInput? where,
    Iterable<TodoOrderByWithAggregationInput>? orderBy,
    required Iterable<TodoScalarFieldEnum> by,
    TodoScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByTodo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByTodo',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByTodo) => groupByTodo.map((Map groupByTodo) =>
        TodoGroupByOutputType.fromJson(groupByTodo.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

@_i1.jsonSerializable
class UserGroupByOutputType implements _i1.JsonSerializable {
  const UserGroupByOutputType({
    this.id,
    this.email,
    this.password,
  });

  factory UserGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$UserGroupByOutputTypeFromJson(json);

  final int? id;

  final String? email;

  final String? password;

  @override
  Map<String, dynamic> toJson() => _$UserGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class TodoGroupByOutputType implements _i1.JsonSerializable {
  const TodoGroupByOutputType({
    this.id,
    this.title,
    this.completed,
    this.userId,
  });

  factory TodoGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$TodoGroupByOutputTypeFromJson(json);

  final int? id;

  final String? title;

  final bool? completed;

  final int? userId;

  @override
  Map<String, dynamic> toJson() => _$TodoGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class AffectedRowsOutput implements _i1.JsonSerializable {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map<String, dynamic> json) =>
      _$AffectedRowsOutputFromJson(json);

  final int? count;

  @override
  Map<String, dynamic> toJson() => _$AffectedRowsOutputToJson(this);
}

class AggregateUser {
  const AggregateUser(this.$query);

  final _i1.PrismaFluentQuery $query;

  UserCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return UserCountAggregateOutputType(query);
  }

  UserAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return UserAvgAggregateOutputType(query);
  }

  UserSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return UserSumAggregateOutputType(query);
  }

  UserMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return UserMinAggregateOutputType(query);
  }

  UserMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return UserMaxAggregateOutputType(query);
  }
}

class AggregateTodo {
  const AggregateTodo(this.$query);

  final _i1.PrismaFluentQuery $query;

  TodoCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return TodoCountAggregateOutputType(query);
  }

  TodoAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return TodoAvgAggregateOutputType(query);
  }

  TodoSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return TodoSumAggregateOutputType(query);
  }

  TodoMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return TodoMinAggregateOutputType(query);
  }

  TodoMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return TodoMaxAggregateOutputType(query);
  }
}

class UserCountOutputType {
  const UserCountOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> todo({TodoWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'Todo',
          fields: fields,
          args: args,
        )
      ]),
      key: r'Todo',
    );
    return query(const []).then((value) => (value as int));
  }
}

class UserCountAggregateOutputType {
  const UserCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> email() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'email',
          fields: fields,
        )
      ]),
      key: r'email',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> password() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'password',
          fields: fields,
        )
      ]),
      key: r'password',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class UserAvgAggregateOutputType {
  const UserAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class UserSumAggregateOutputType {
  const UserSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class UserMinAggregateOutputType {
  const UserMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> email() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'email',
          fields: fields,
        )
      ]),
      key: r'email',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> password() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'password',
          fields: fields,
        )
      ]),
      key: r'password',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class UserMaxAggregateOutputType {
  const UserMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> email() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'email',
          fields: fields,
        )
      ]),
      key: r'email',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> password() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'password',
          fields: fields,
        )
      ]),
      key: r'password',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class TodoCountAggregateOutputType {
  const TodoCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> title() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'title',
          fields: fields,
        )
      ]),
      key: r'title',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> completed() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'completed',
          fields: fields,
        )
      ]),
      key: r'completed',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> userId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'userId',
          fields: fields,
        )
      ]),
      key: r'userId',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class TodoAvgAggregateOutputType {
  const TodoAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }

  Future<double?> userId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'userId',
          fields: fields,
        )
      ]),
      key: r'userId',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class TodoSumAggregateOutputType {
  const TodoSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<int?> userId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'userId',
          fields: fields,
        )
      ]),
      key: r'userId',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class TodoMinAggregateOutputType {
  const TodoMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> title() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'title',
          fields: fields,
        )
      ]),
      key: r'title',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<bool?> completed() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'completed',
          fields: fields,
        )
      ]),
      key: r'completed',
    );
    return query(const []).then((value) => (value as bool?));
  }

  Future<int?> userId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'userId',
          fields: fields,
        )
      ]),
      key: r'userId',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class TodoMaxAggregateOutputType {
  const TodoMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> title() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'title',
          fields: fields,
        )
      ]),
      key: r'title',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<bool?> completed() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'completed',
          fields: fields,
        )
      ]),
      key: r'completed',
    );
    return query(const []).then((value) => (value as bool?));
  }

  Future<int?> userId() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'userId',
          fields: fields,
        )
      ]),
      key: r'userId',
    );
    return query(const []).then((value) => (value as int?));
  }
}

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  includeIfNull: false,
)
class Datasources implements _i1.JsonSerializable {
  const Datasources({this.db});

  final String? db;

  @override
  Map<String, dynamic> toJson() => _$DatasourcesToJson(this);
}

class PrismaClient extends _i1.BasePrismaClient<PrismaClient> {
  PrismaClient._internal(
    _i3.Engine engine, {
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  })  : _engine = engine,
        _headers = headers,
        _transaction = transaction,
        super(
          engine,
          headers: headers,
          transaction: transaction,
        );

  factory PrismaClient({
    Datasources? datasources,
    Iterable<_i4.Event>? stdout,
    Iterable<_i4.Event>? event,
  }) {
    final logger = _i4.Logger(
      stdout: stdout,
      event: event,
    );
    final engine = _i5.BinaryEngine(
      logger: logger,
      schema:
          r'Ly8gVGhpcyBpcyB5b3VyIFByaXNtYSBzY2hlbWEgZmlsZSwNCi8vIGxlYXJuIG1vcmUgYWJvdXQgaXQgaW4gdGhlIGRvY3M6IGh0dHBzOi8vcHJpcy5seS9kL3ByaXNtYS1zY2hlbWENCg0KZ2VuZXJhdG9yIGNsaWVudCB7DQogIHByb3ZpZGVyID0gImRhcnQgcnVuIG9ybSINCiAgb3V0cHV0ICAgPSAiLi4vbGliL2NvcmUvb3JtIg0KfQ0KDQpkYXRhc291cmNlIGRiIHsNCiAgcHJvdmlkZXIgICAgICAgICAgPSAicG9zdGdyZXNxbCINCiAgdXJsICAgICAgICAgICAgICAgPSBlbnYoIkRBVEFCQVNFX1VSTCIpDQogIHNoYWRvd0RhdGFiYXNlVXJsID0gZW52KCJTSEFET1dfREFUQUJBU0VfVVJMIikNCiAgcmVsYXRpb25Nb2RlICAgICAgPSAicHJpc21hIg0KfQ0KDQptb2RlbCBVc2VyIHsNCiAgaWQgICAgICAgSW50ICAgIEBpZCBAZGVmYXVsdChhdXRvaW5jcmVtZW50KCkpDQogIGVtYWlsICAgIFN0cmluZyBAdW5pcXVlDQogIHBhc3N3b3JkIFN0cmluZw0KICBUb2RvICAgICBUb2RvW10NCn0NCg0KbW9kZWwgVG9kbyB7DQogIGlkICAgICAgICBJbnQgICAgIEBpZCBAZGVmYXVsdChhdXRvaW5jcmVtZW50KCkpDQogIHRpdGxlICAgICBTdHJpbmcNCiAgY29tcGxldGVkIEJvb2xlYW4gQGRlZmF1bHQoZmFsc2UpDQogIHVzZXIgICAgICBVc2VyICAgIEByZWxhdGlvbihmaWVsZHM6IFt1c2VySWRdLCByZWZlcmVuY2VzOiBbaWRdKQ0KICB1c2VySWQgICAgSW50DQoNCiAgQEBpbmRleChbdXNlcklkXSkNCn0NCg==',
      datasources: datasources?.toJson().cast() ?? const {},
      executable:
          r'C:\Users\ishaf\WebstormProjects\reels\server\node_modules\prisma\query-engine-windows.exe',
    );
    return PrismaClient._internal(engine);
  }

  final _i3.Engine _engine;

  final _i3.QueryEngineRequestHeaders? _headers;

  final _i3.TransactionInfo? _transaction;

  @override
  PrismaClient copyWith({
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  }) =>
      PrismaClient._internal(
        _engine,
        headers: headers ?? _headers,
        transaction: transaction ?? _transaction,
      );

  _i1.ModelDelegate<User> get user => _i1.ModelDelegate<User>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );

  _i1.ModelDelegate<Todo> get todo => _i1.ModelDelegate<Todo>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
}
