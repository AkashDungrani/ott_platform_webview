import 'package:flutter/material.dart';
import 'package:ottplatform/views/screens/ottplatform.dart';

import 'models/globals.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => OTT(),
        "ottplatform":(context) => OttPlatform(),
      },
    ),
  );
}
class OTT extends StatefulWidget {
  const OTT({super.key});

  @override
  State<OTT> createState() => _OTTState();
}

class _OTTState extends State<OTT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Educational Web"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            ...platform.map((e) => 
                   Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                  onTap: () async {
                    Navigator.pushNamed(context, "ottplatform", arguments: e);
                  },
                              child: Container(
                                height: 100,
                                width: 100,
                                child: Image.asset(e["image"]),
                              ),
                            ),
                            Text(
                              e["name"],
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(),
                          ],
                        )
                      ]),
                
                ),
          ]),
        ),
      ),
    );
  }
}