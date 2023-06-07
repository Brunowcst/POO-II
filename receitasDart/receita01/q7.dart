import 'package:flutter/material.dart';

void main() {
  
  MaterialApp app = MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
        )
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
          Expanded(child: 
            IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
              }
            )
          ),

          Expanded(child: 
            IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
              }
            )
          ),

          Expanded(child: 
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
              }
            )
          )],
        )
      )
    );
  runApp(app);
}