import 'dart:convert';
import 'server/server.dart';
import 'package:http/http.dart' as http;
import 'package:exaroton/env/env.dart';

class Exaroton {
  late final String API_KEY;
  Exaroton(this.API_KEY);

  Future<String> postSystem(String endpoint) async {
    var postUrl = '${env.baseUrl}/${endpoint}';

    final response = await http.post(
      Uri.parse('${postUrl}'),
      headers: {
        'Authorization': 'Bearer ${API_KEY}',
        'Content-Type': 'application/json'
      },
    );
    return response.body;
  }

  Future<String> postSystemWithBody(String endpoint, String body) async {
    var postUrl = '${env.baseUrl}/${endpoint}';

    final response = await http.post(
      Uri.parse('${postUrl}'),
      headers: {
        'Authorization': 'Bearer ${API_KEY}',
        'Content-Type': 'application/json'
      },
      body: body,
    );
    return response.body;
  }

  Future<String> accountInfo(data) async {
    var endpoint = 'account/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    if (data == 'credits') {
      var credits = decodedJSON['data']['credits'];
      return credits.toString();
    } else if (data == 'email') {
      var email = decodedJSON['data']['email'];
      return email;
    } else if (data == 'name') {
      var name = decodedJSON['data']['name'];
      return name;
    } else if (data == 'verified') {
      var verified = decodedJSON['data']['verified'];
      return verified.toString();
    } else {
      return 'You must enter a data. Try "credits", "email", or "name".';
    }
  }

  Future<String> account() async {
    var endpoint = 'account/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data'];
    return info.toString();
  }

  Future<String> servers() async {
    var endpoint = 'servers/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON;
    return info.toString();
  }

  Future<String> restartServer(String serverId) async {
    var endpoint = 'servers/${serverId}/restart/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON;
    return info.toString();
  }

  Future<String> stopServer(String serverId) async {
    var endpoint = 'servers/${serverId}/stop/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON;
    return info.toString();
  }

  Future<String> startServer(String serverId) async {
    var endpoint = 'servers/${serverId}/start/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON;
    return info.toString();
  }

  Future<String> commandToServer(String serverId, String command) async {
    var endpoint = 'servers/${serverId}/command/';
    var body = jsonEncode({"command": "$command"});
    var notParsedJSON = await postSystemWithBody(endpoint, body);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON;
    return info.toString();
  }

  Future<String> changeRAM(String serverId, String ram) async {
    var endpoint = 'servers/${serverId}/options/ram/';
    var body = jsonEncode({"ram": "$ram"});
    var notParsedJSON = await postSystemWithBody(endpoint, body);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON;
    return info.toString();
  }

  Future<String> getRAM(String serverId) async {
    var endpoint = 'servers/${serverId}/options/ram/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data']['ram'];
    return info.toString();
  }

  Future<String> getLog(String serverId) async {
    var endpoint = 'servers/${serverId}/logs/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data']['content'];
    return info.toString();
  }

  Future<String> shareLog(String serverId) async {
    var endpoint = 'servers/${serverId}/logs/share/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data'];
    return info.toString();
  }

  Future<String> getMOTD(String serverId) async {
    var endpoint = 'servers/${serverId}/options/motd';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data']['motd'];
    return info.toString();
  }

  Future<String> setMOTD(String serverId, String motd) async {
    var endpoint = 'servers/${serverId}/options/motd';
    var body = jsonEncode({"motd": "$motd"});
    var notParsedJSON = await postSystemWithBody(endpoint, body);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data'];
    return info.toString();
  }
}
