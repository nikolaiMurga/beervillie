// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beers_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorBeersDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BeersDataBaseBuilder databaseBuilder(String name) =>
      _$BeersDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$BeersDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$BeersDataBaseBuilder(null);
}

class _$BeersDataBaseBuilder {
  _$BeersDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$BeersDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$BeersDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<BeersDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$BeersDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$BeersDataBase extends BeersDataBase {
  _$BeersDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  BeerDao? _beerDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `_beer` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `first_brewed` TEXT NOT NULL, `description` TEXT NOT NULL, `image_url` TEXT, `abv` REAL, `ibu` REAL, `ebc` REAL, `hops` TEXT NOT NULL, `malt` TEXT NOT NULL, `food_pairing` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  BeerDao get beerDao {
    return _beerDaoInstance ??= _$BeerDao(database, changeListener);
  }
}

class _$BeerDao extends BeerDao {
  _$BeerDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _beerItemDataInsertionAdapter = InsertionAdapter(
            database,
            '_beer',
            (BeerItemData item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'first_brewed': item.firstBrewed,
                  'description': item.description,
                  'image_url': item.imageUrl,
                  'abv': item.abv,
                  'ibu': item.ibu,
                  'ebc': item.ebc,
                  'hops': item.hops,
                  'malt': item.malt,
                  'food_pairing': item.foodPairing
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<BeerItemData> _beerItemDataInsertionAdapter;

  @override
  Future<void> deleteBeers() async {
    await _queryAdapter.queryNoReturn('DELETE FROM _beer');
  }

  @override
  Future<List<BeerItemData>> getBeers() async {
    return _queryAdapter.queryList('SELECT * FROM _beer',
        mapper: (Map<String, Object?> row) => BeerItemData(
            id: row['id'] as int,
            name: row['name'] as String,
            firstBrewed: row['first_brewed'] as String,
            description: row['description'] as String,
            imageUrl: row['image_url'] as String?,
            abv: row['abv'] as double?,
            ibu: row['ibu'] as double?,
            ebc: row['ebc'] as double?,
            hops: row['hops'] as String,
            malt: row['malt'] as String,
            foodPairing: row['food_pairing'] as String));
  }

  @override
  Future<void> insertBeers(List<BeerItemData> beers) async {
    await _beerItemDataInsertionAdapter.insertList(
        beers, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateBeers(List<BeerItemData> beers) async {
    if (database is sqflite.Transaction) {
      await super.updateBeers(beers);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$BeersDataBase(changeListener)
          ..database = transaction;
        await transactionDatabase.beerDao.updateBeers(beers);
      });
    }
  }
}
