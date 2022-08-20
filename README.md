# Exaroton API
 Unofficial Exaroton API for Dart
 
 Original Docs:https://developers.exaroton.com/

# How to use?

First you need to install exaroton package to your Flutter project.

```shell
flutter pub add exaroton
```

Then you can import the library and declare your API to use Exaroton API's
```dart
import 'package:exaroton/exaroton.dart';
```

```dart
var exaroton = Exaroton('YOUR_API_KEY');
```
* All functions works only with await command.

Now you are ready to use Exaroton. Little Note: all server commands need ServerID in order to use. You can find your ServerID using findServerID() function.

```dart
var my_serverID = await exaroton.findServerID();
```

You should recieve a List() something like this.
```
Server Name - ServerID, Server Name 2 - ServerID2
```

You can find your server id with this Function.

## DOCS

**Exaroton API for Dart** support 15 Endpoints for now. Here is a quick peek.

```dart
var my_accountInfo = await exaroton.accountInfo(data);
var my_account = await exaroton.account();
var my_serverID = await exaroton.findServerID();
var my_servers = await exaroton.servers(ServerID);
var my_serverInfo = await exaroton.serversInfo(ServerID, data);
await exaroton.restartServer(ServerID);
await exaroton.stopServer(ServerID);
await exaroton.startServer(ServerID);
await exaroton.commandToServer(ServerID, command);
await exaroton.changeRAM(ServerID, RamAmount);
await exaroton.setMOTD(ServerID, MOTD);
var my_serverRam = await exaroton.getRAM(ServerID);
var my_serverLog = await exaroton.getLog(ServerID);
var my_serverLogUrl = await exaroton.shareLog(ServerID);
var my_serverMOTD = await exaroton.getMOTD(ServerID);

```

### Account Info
```dart
var my_accountInfo = await exaroton.accountInfo(data);
```
Takes one argument, then give you a String back.

You can use:
* 'credits' to get your credits.
* 'email' to get your email.
* 'name' to get your username.
* 'verified' to check if you are verified.

### Account
```dart
var my_account = await exaroton.account();
```
This function works just as like accountInfo. The only difference is, that you don't give any argument and the function gives you back the whole JSON.

### Find Server ID
```dart
var my_serverID = await exaroton.findServerID();
```
This function help you to find your Server ID.

Here is the output: `Server Name - ServerID, Server Name 2 - ServerID2`

### Servers Info
```dart
var my_serverInfo = await exaroton.serversInfo(ServerID, data);
```
This function needs your Server ID to work. Work just as like the accountInfo but now it gives you back the server info.

You can use:
* 'name' to get your server name.
* 'address' to get your server address.
* 'motd' to get your server motd.
* 'status' to check your server status. [Server Status](https://developers.exaroton.com/#header-server-status)
* 'host' to get your host ip.
* 'maxplayers' to get your maximum player number.
* 'playercount' to get your currently playing player number.
* 'playerlist' to get your currently playing player list.
* 'software' to get your servers software details.
* 'share' to find if your server has shared option.

### Servers
```dart
var my_servers = await exaroton.servers(ServerID);
```
This function works just as like serverInfo. The only difference is, that you don't give any argument and the function gives you back the whole JSON. You need to provide a ServerID in order to work.

### Get Ram
```dart
var my_serverRam = await exaroton.getRAM(ServerID);
```
You can use this function to get your RAM Amount. You need to provide a ServerID in order to work.

### Get Motd
```dart
var my_serverMOTD = await exaroton.getMOTD(ServerID);
```
You can use this function to get your MOTD. You need to provide a ServerID in order to work.

### Get Log
```dart
var my_serverLog = await exaroton.getLog(ServerID);
```
You can use this function to get your Log. You need to provide a ServerID in order to work.

### Get Log Url
```dart
var my_serverLogUrl = await exaroton.shareLog(ServerID)
```
You can use this function to get your Log Url. You need to provide a ServerID in order to work.

### Start Server
```dart
await exaroton.startServer(ServerID);
```
You can use this function to start your server. You need to provide a ServerID in order to work.

### Stop Server
```dart
await exaroton.stopServer(ServerID);
```
You can use this function to stop your server. You need to provide a ServerID in order to work.

### Restart Server
```dart
await exaroton.restartServer(ServerID);
```
You can use this function to restart your server. You need to provide a ServerID in order to work.

### Command To Server
```dart
await exaroton.commandToServer(ServerID, command);
```
You can use this function to send commands to your server. You need to provide a ServerID in order to work.

You can use any Minecraft commands with this functions, such as:
* gamemode 1 @a
* gamerule KeepInventory true
* time set day

### Change Ram
```dart
await exaroton.changeRAM(ServerID, RamAmount);
```
You can use this function to change ram on your server. You need to provide a ServerID in order to work and you need to provide a ram amount in Strings. Maximum you can use is 12.

### Change Motd
```dart
await exaroton.setMOTD(ServerID, MOTD);
```
You can use this function to change motd of your server. You need to provide a ServerID in order to work and you need to provide a String to determine your motd.

# Contributions 
Feel free to fork and use my project, or help me to develope!

# Exaroton API
If there is any legal problems, you can reach me through yavuz@cidqu.net
