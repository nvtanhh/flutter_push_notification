import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notification/app_push.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppPushs(child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
//   void initState() {
//     super.initState();
//     // Android setting
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     // IOS setting
//     var initializationSettingsIOS = IOSInitializationSettings(
//       onDidReceiveLocalNotification:
//           (int id, String title, String body, String payload) async {
//         didReceiveLocalNotificationSubject.add(
//           ReceivedNotification(
//               id: id, title: title, body: body, payload: payload),
//         );
//       },
//     );

//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (String payload) async {
//       if (payload != null) {
//         debugPrint('notification payload: ' + payload);
//       }
//       selectNotificationSubject.add(payload);
//     });

//     didReceiveLocalNotificationSubject.stream
//         .listen((ReceivedNotification receivedNotification) async {
//       await showDialog(
//         context: context,
//         builder: (BuildContext context) => CupertinoAlertDialog(
//           title: receivedNotification.title != null
//               ? Text(receivedNotification.title)
//               : null,
//           content: receivedNotification.body != null
//               ? Text(receivedNotification.body)
//               : null,
//           actions: [
//             CupertinoDialogAction(
//               isDefaultAction: true,
//               child: Text('Ok'),
//               onPressed: () async {
// //                Navigator.of(context, rootNavigator: true).pop();
// //                await Navigator.push(
// //                  context,
// //                  MaterialPageRoute(
// //                    builder: (context) =>
// //                        SecondScreen(receivedNotification.payload),
// //                  ),
// //                );
//               },
//             )
//           ],
//         ),
//       );
//     });

//     selectNotificationSubject.stream.listen((String payload) async {
// //      await Navigator.push(
// //        context,
// //        MaterialPageRoute(builder: (context) => SecondScreen(payload)),
// //      );
//     });

//     // For iOS request permission first.
//     _firebaseMessaging.requestNotificationPermissions();
//     // _firebaseMessaging.configure();

//     _firebaseMessaging
//         .getToken()
//         .then((value) => print("FirebaseMessaging token: $value"));

//     _firebaseMessaging.configure(
//         onBackgroundMessage: Platform.isIOS
//             ? null
//             : (message) => myBackgroundMessageHandler(message),
//         onMessage: (Map<String, dynamic> message) async {
//           print('onMessage: $message');
//           final notification = message['notification'];
//           setState(
//             () {
//               //messages.add(Message(title: notification['title'],body: notification['body']));
//               //Utils.showToast(notification['title']);
//               _showNotification(notification['title'], notification['body']);
//             },
//           );
//         },
//         onLaunch: (Map<String, dynamic> message) async {
//           print('onLaunch: $message');
//         },
//         onResume: (Map<String, dynamic> message) async {
//           print('onResume: $message');
//         });
//     _firebaseMessaging.requestNotificationPermissions(
//         const IosNotificationSettings(sound: true, badge: true, alert: true));
//   }

  //updated myBackgroundMessageHandler
  // static Future<dynamic> myBackgroundMessageHandler(
  //     Map<String, dynamic> message) async {
  //   print("myBackgroundMessageHandler message: $message");
  //   int msgId = int.tryParse(message["data"]["msgId"].toString()) ?? 0;
  //   print("msgId $msgId");
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //       'your channel id', 'your channel name', 'your channel description',
  //       color: Colors.blue.shade800,
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       ticker: 'ticker');
  //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  //   var platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: iOSPlatformChannelSpecifics);
  //   flutterLocalNotificationsPlugin.show(msgId, message["data"]["msgTitle"],
  //       message["data"]["msgBody"], platformChannelSpecifics,
  //       payload: message["data"]["data"]);
  //   return Future<void>.value();
  // }

  // static Future<void> _showNotification(String title, String body) async {
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //       'infixEdu', 'infix', 'this channel description',
  //       importance: Importance.max, priority: Priority.high, ticker: 'ticker');
  //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  //   var platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics,
  //       iOS: iOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, '$title', '$body', platformChannelSpecifics,
  //       payload: 'infixEdu');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
