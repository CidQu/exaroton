import 'package:exaroton/exaroton.dart';

void main() async {
  var example = Exaroton('API_KEY');
  print(await example.accountInfo(''));
}
