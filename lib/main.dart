import 'package:display/features/banner/presentation/pages/banner_page.dart';
import 'package:display/features/upcoming_event/presentation/pages/upcoming_event_page.dart';
import 'package:flutter/material.dart';
import 'package:display/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildBanner(context),
            buildUpcomingEvent(context),
          ],
        ),
      ),
    );
  }
}
