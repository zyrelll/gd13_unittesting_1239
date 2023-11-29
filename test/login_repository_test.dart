import 'package:flutter_test/flutter_test.dart';
import 'package:gd13_unittesting_1239/repository/login_repository.dart';

void main() {
  test('Login Success', () async {
    final hasil = await LoginRepository.logintesting(
        username: 'arif_1239', password: 'c_1239');
    expect(hasil?.data.username, equals('arif_1239'));
    expect(hasil?.data.password, equals('c_1239'));
  });

  test('Login Failed', () async {
    final result = await LoginRepository.logintesting(
        username: 'invalid', password: 'invalid');
    expect(result, null);
  });
}
