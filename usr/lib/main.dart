import 'package:flutter/material.dart';

void main() {
  runApp(const TeenPattiApp());
}

class TeenPattiApp extends StatelessWidget {
  const TeenPattiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teen Patti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/game': (context) => const GameScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Teen Patti',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                  shadows: [
                    Shadow(blurRadius: 10, color: Colors.black, offset: Offset(2, 2)),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                onPressed: () => Navigator.pushNamed(context, '/game'),
                child: const Text('Play Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20), // Casino green table
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Table #1', style: TextStyle(color: Colors.white70)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          // The table outline
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber.withOpacity(0.5), width: 4),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          // Pot center
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Pot',
                  style: TextStyle(color: Colors.amber, fontSize: 16),
                ),
                Text(
                  '₹ 10,500',
                  style: TextStyle(
                      color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // Players
          const Positioned(bottom: 20, left: 0, right: 0, child: PlayerSeat(name: 'You', money: '₹ 50,000', isActive: true)),
          const Positioned(top: 20, left: 0, right: 0, child: PlayerSeat(name: 'Player 2', money: '₹ 32,000')),
          const Positioned(top: 200, left: 10, child: PlayerSeat(name: 'Player 3', money: '₹ 15,000')),
          const Positioned(top: 200, right: 10, child: PlayerSeat(name: 'Player 4', money: '₹ 80,000')),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text('Pack', style: TextStyle(color: Colors.redAccent, fontSize: 18)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Blind', style: TextStyle(color: Colors.grey, fontSize: 18)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, foregroundColor: Colors.black),
              onPressed: () {},
              child: const Text('Chaal', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerSeat extends StatelessWidget {
  final String name;
  final String money;
  final bool isActive;

  const PlayerSeat({
    super.key,
    required this.name,
    required this.money,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive ? Colors.amber.withOpacity(0.3) : Colors.black45,
            border: Border.all(color: isActive ? Colors.amber : Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(money, style: const TextStyle(color: Colors.amberAccent, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}
