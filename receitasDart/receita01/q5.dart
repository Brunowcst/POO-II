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

        bottomNavigationBar: Row(children: [
          IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
            }),

            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
            }),

            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
            })],
        )
      )
    );
  runApp(app);
}