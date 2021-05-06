import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DatabaseProvider {
  static const String TABLE_EXPENSES = "expenses";
  static const String COLUMN_ID = "id";
  static const String COLUMN_TITLE = "title";
  static const String COLUMN_AMOUNT = "amount";
  static const String COLUMN_DATE = "date";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;
  Future<Database> get database async {
    print("Database getter called");
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, 'expense.db'), version: 1,
        onCreate: (Database database, int version) async {
      print('Creating table for debug');

      await database.execute(
        "CREATE TABLE $TABLE_EXPENSES ("
        "$COLUMN_ID TEXT, "
        "$COLUMN_TITLE TEXT, "
        "$COLUMN_AMOUNT REAL, "
        "$COLUMN_DATE TEXT )",
      );
    });
  }
}
