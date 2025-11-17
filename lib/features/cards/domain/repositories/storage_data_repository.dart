import 'package:fin_uslugi/core/utils/storage_util.dart';
import 'package:fin_uslugi/features/cards/data/models/user.dart';
import 'package:fin_uslugi/features/cards/data/repositories/storage_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: StorageRepository)
class StorageDataRepository extends StorageRepository {
  final StorageUtil _storageUtil;

  StorageDataRepository(this._storageUtil);

  User? _user;

  @override
  Future<User> loadUser() async {
    if (_user != null) {
      return _user!;
    }
    _user = await _storageUtil.loadUser();
    return _user!;
  }

  @override
  Future<void> saveUser({required User user}) {
    _user = user;
    return _storageUtil.saveUser(user);
  }
}
