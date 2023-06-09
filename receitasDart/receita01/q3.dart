import 'package:flutter/material.dart';

void main() {

  MaterialApp app = MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello world!!!")),
        body: Center(
          child: Column(
            children: const [
              Text(
                "Começando...",
                style: TextStyle(
                  color: Colors.orange,
                  fontStyle: FontStyle.italic)),
              Text("No meio..."),
              Text("Terminando...")]
          )
        ),

        bottomNavigationBar: Row(children: const [
            Text("Texto 1"),
            Text("Texto 2"),
            Text("Texto 3")],
        )
      )
    );
  runApp(app);
}