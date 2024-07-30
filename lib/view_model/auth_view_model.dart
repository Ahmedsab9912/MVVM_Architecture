import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:providerprac/repository/auth_repository.dart';
import 'package:providerprac/utils/routes/routes_name.dart';
import 'package:providerprac/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

//Using loading state to show progress indicator
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((error) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(context, "Login Successfully", Colors.green);
        Navigator.pushNamed(context, RoutesName.home);
        print(error.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        setLoading(false);
        Utils.flushBarErrorMessage(context, error.toString(), Colors.red);
        print(error.toString());
      }
    });
  }
}
