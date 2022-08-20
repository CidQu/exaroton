import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:exaroton/env/env.dart';

class Exaroton {
  late final String API_KEY;
  Exaroton(this.API_KEY);

  Future<String> postSystem(String endpoint) async {
    var postUrl = '${env.baseUrl}/${endpoint}';

    final response = await http.get(
      Uri.parse('${postUrl}'),
      headers: {
        'Authorization': 'Bearer ${API_KEY}',
        'Content-Type': 'application/json'
      },
    );
    return response.body.toString();
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
    return response.body.toString();
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

  Future account() async {
    var endpoint = 'account/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON)['data'];
    var info = decodedJSON;
    return info.toString();
  }

  Future findServerID() async {
    var endpoint = 'servers/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var servers = decodedJSON['data'] as List;
    var lenght = servers.length;
    if (lenght == 0) {
      return 'No servers found.';
    } else {
      List returnList = [];
      for (var i = 0; i < lenght; i++) {
        var serverid = decodedJSON['data'][i]['id'];
        var serverName = decodedJSON['data'][i]['name'];
        var server = '$serverid - $serverName';
        returnList.add(server);
      }
      return returnList;
    }
  }

  Future servers(String serverId) async {
    var endpoint = 'servers/$serverId/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON)['data'];
    var info = decodedJSON;
    return info;
  }

  Future serversInfo(String serverId, String data) async {
    var endpoint = 'servers/$serverId/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    if (data == 'name') {
      var name = decodedJSON['data']['name'];
      return name;
    } else if (data == 'address') {
      var address = decodedJSON['data']['address'];
      return address;
    } else if (data == 'motd') {
      var motd = decodedJSON['data']['motd'];
      return motd;
    } else if (data == 'status') {
      var status = decodedJSON['data']['status'];
      return status.toString();
    } else if (data == 'host') {
      var host = decodedJSON['data']['host'];
      return host.toString();
    } else if (data == 'maxplayers') {
      var verified = decodedJSON['data']['players']['max'];
      return verified.toString();
    } else if (data == 'playercount') {
      var verified = decodedJSON['data']['players']['count'];
      return verified.toString();
    } else if (data == 'playerlist') {
      var verified = decodedJSON['data']['players']['list'];
      return verified.toString();
    } else if (data == 'software') {
      var verified = decodedJSON['data']['software'];
      return verified.toString();
    } else if (data == 'software') {
      var verified = decodedJSON['data']['shared'];
      return verified.toString();
    } else {
      return 'You must enter a data. Try "name", "address", "motd", "status", "host", "maxplayers", "playercount", "playerlist", "software" or "shared".';
    }
  }

  Future<String> restartServer(String serverId) async {
    var endpoint = 'servers/$serverId/restart/';
    var notParsedJSON = await postSystem(endpoint);
    var info = notParsedJSON;
    return info.toString();
  }

  Future<String> stopServer(String serverId) async {
    var endpoint = 'servers/${serverId}/stop/';
    var notParsedJSON = await postSystem(endpoint);
    var info = notParsedJSON;
    return info.toString();
  }

  Future<String> startServer(String serverId) async {
    var endpoint = 'servers/${serverId}/start/';
    var notParsedJSON = await postSystem(endpoint);
    var info = notParsedJSON;
    return info.toString();
  }

  Future<String> commandToServer(String serverId, String command) async {
    var endpoint = 'servers/${serverId}/command/';
    var body = jsonEncode({"command": "$command"});
    var notParsedJSON = await postSystemWithBody(endpoint, body);
    var info = notParsedJSON;
    return info.toString();
  }

  Future changeRAM(String serverId, String ram) async {
    var endpoint = 'servers/${serverId}/options/ram/';
    var body = jsonEncode({"ram": "$ram"});
    var notParsedJSON = await postSystemWithBody(endpoint, body);
    var info = notParsedJSON;
    return info;
  }

  Future getRAM(String serverId) async {
    var endpoint = 'servers/${serverId}/options/ram/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data']['ram'];
    return info;
  }

  Future getLog(String serverId) async {
    var endpoint = 'servers/${serverId}/logs/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data']['content'];
    return info;
  }

  Future shareLog(String serverId) async {
    var endpoint = 'servers/${serverId}/logs/share/';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data'];
    return info;
  }

  Future getMOTD(String serverId) async {
    var endpoint = 'servers/${serverId}/options/motd';
    var notParsedJSON = await postSystem(endpoint);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data']['motd'];
    return info;
  }

  Future setMOTD(String serverId, String motd) async {
    var endpoint = 'servers/${serverId}/options/motd';
    var body = jsonEncode({"motd": "$motd"});
    var notParsedJSON = await postSystemWithBody(endpoint, body);
    var decodedJSON = jsonDecode(notParsedJSON);
    var info = decodedJSON['data'];
    return info;
  }
}
