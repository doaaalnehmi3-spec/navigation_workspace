import 'package:flutter/material.dart';
import 'navigation_demo.dart';
import 'store_catalog.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Workspace',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Navigation & Data Passing Suite',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueGrey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Demonstrating Navigator methods in Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            
            // Task 1: Simple Navigation
            Card(
              child: ListTile(
                leading: const Icon(Icons.layers, color: Colors.indigo),
                title: const Text('Simple Navigation Screen'),
                subtitle: const Text('Demonstrates Push and Pop methods'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                },
              ),
            ),
            const SizedBox(height: 12),
            
            // Task 2: Data Passing
            Card(
              child: ListTile(
                leading: const Icon(Icons.shopping_bag, color: Colors.teal),
                title: const Text('Store Catalog Screen'),
                subtitle: const Text('Demonstrates passing and returning data'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}