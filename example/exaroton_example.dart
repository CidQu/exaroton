import 'package:exaroton/exaroton.dart';

void main() async {
  var example = Exaroton('API_KEY');
  var xd = await example.shareLog('SERVER_ID');
  print(xd['url']);
}
