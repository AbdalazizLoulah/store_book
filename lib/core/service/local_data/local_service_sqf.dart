import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalServiceSqf {
  static Database? _db;
  Future<Database?> get checkDb async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, "wishList.db");
    Database db = await openDatabase(path, onCreate: _onCreate,version: 1);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE Test (
    id INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    image TEXT,
    price TEXT
)
''');
    print("create DATABASE=====================");
  }

  readData(String sql) async {
    Database? Mydb = await checkDb;
    List<Map<String,dynamic>> response = await Mydb!.rawQuery(sql);
    print("read data=====================");
    return response;
    
  }
  Future<int> insertData({
    required String name,
    required String image,
    required String price,
  }) async {
    final db = await checkDb;
    return await db!.rawInsert(
      'INSERT INTO Test (name, image, price) VALUES(?, ?, ?)',[
      name,
      image,
      price,
    ]);
  }

  updateData(String sql) async {
    Database? Mydb = await checkDb;
    int response = await Mydb!.rawUpdate(sql);
    print("update data DATABASE=====================");
    return response;
  }

  deletData(String sql) async {
    Database? Mydb = await checkDb;
    int response = await Mydb!.rawDelete(sql);
    print("update DATABASE=====================");
    return response;
  }

  
}
