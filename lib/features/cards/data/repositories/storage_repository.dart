import 'package:fin_uslugi/features/cards/data/models/user.dart';

abstract class StorageRepository {
  Future<void> saveUser({required User user});

  Future<User> loadUser();
}
