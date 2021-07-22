import 'package:moor/moor.dart';

import '../app_db.dart';
import '../tables/students.dart';

part 'students.g.dart';

@UseDao(tables: [Students])
class StudentsDao extends DatabaseAccessor<AppDb> with _$StudentsDaoMixin {
  StudentsDao(AppDb db) : super(db);
}
