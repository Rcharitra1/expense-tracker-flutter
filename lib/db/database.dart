import 'package:expense_tracker/model/transaction.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
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

  Future<List<TransactionQ>> getTransactions() async {
    final db = await database;

    var transactions = await db.query(TABLE_EXPENSES,
        columns: [COLUMN_ID, COLUMN_TITLE, COLUMN_AMOUNT, COLUMN_DATE]);
    List<TransactionQ> transactionList = List<TransactionQ>();
    transactions.forEach((element) {
      TransactionQ transactionQ = TransactionQ.fromMap(element);

      transactionList.add(transactionQ);
    });
    return transactionList;
  }

  Future<TransactionQ> insert(TransactionQ transactionQ) async {
    final db = await database;
    await db.insert((TABLE_EXPENSES), transactionQ.toMap());
    print('i go here');
    return transactionQ;
  }

  void delete(String id) async {
    final db = await database;
    await db.delete(TABLE_EXPENSES, where: "$COLUMN_ID = ?", whereArgs: [id]);
  }
}
