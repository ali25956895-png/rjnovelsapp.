import 'package:flutter/material.dart';

void main() {
  runApp(const RJKingNovelsApp());
}

class RJKingNovelsApp extends StatelessWidget {
  const RJKingNovelsApp({super.key});

  @override
  Widget build(BuildContext WidgetContext) {
    return MaterialApp(
      title: 'RJ King Novels',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        primaryColor: Colors.amber,
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          secondary: Colors.amberAccent,
        ),
      ),
      home: const MainPlatformShell(),
    );
  }
}

class MainPlatformShell extends StatefulWidget {
  const MainPlatformShell({super.key});

  @override
  State<MainPlatformShell> createState() => _MainPlatformShellState();
}

class _MainPlatformShellState extends State<MainPlatformShell> {
  int _currentTab = 0;
  bool _isOwnerLoggedIn = false;

  double _monthlyViews = 120000;
  final double _targetEarning = 500000;

  @override
  Widget build(BuildContext WidgetContext) {
    double estimatedEarnings = (_monthlyViews / 1000) * 840; 
    double milestoneProgress = (estimatedEarnings / _targetEarning).clamp(0.0, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('👑 RJ KING NOVELS', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber)),
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_isOwnerLoggedIn ? Icons.admin_panel_settings : Icons.lock_open, color: Colors.amber),
            onPressed: () {
              setState(() {
                _isOwnerLoggedIn = !_isOwnerLoggedIn;
              });
              ScaffoldMessenger.of(WidgetContext).showSnackBar(
                SnackBar(
                  content: Text(_isOwnerLoggedIn 
                    ? 'Welcome Back Owner! Owner Calculator Activated.' 
                    : 'Logged out from Owner Panel.'),
                  backgroundColor: Colors.amber,
                ),
              );
            },
          )
        ],
      ),
      body: IndexedStack(
        index: _currentTab,
        children: [
          _buildReaderMode(),
          _buildWriterPortal(),
          if (_isOwnerLoggedIn) _buildOwnerCalculator(estimatedEarnings, milestoneProgress),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF121212),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentTab,
        onTap: (index) {
          if (index == 2 && !_isOwnerLoggedIn) {
            ScaffoldMessenger.of(WidgetContext).showSnackBar(
              const SnackBar(content: Text('Access Denied: Only RJ KING can view this dashboard!')),
            );
            return;
          }
          setState(() {
            _currentTab = index;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Reader Mode'),
          const BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Writer Portal'),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics, color: _isOwnerLoggedIn ? Colors.amber : Colors.grey),
            label: 'Owner Dashboard',
          ),
        ],
      ),
    );
  }

  Widget _buildReaderMode() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAdSlot('GOOGLE AD SLOT (100% ADMIN REVENUE)'),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xFF161616),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.withOpacity(0.1)),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.between,
                  children: [
                    Text('The Mafia King\'s Return', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                    Text('Chapter 1', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                Divider(color: Colors.amber, height: 30),
                Text(
                  'The dark sedan pulled up beside the rain-slicked pavement. RJ King stepped into the dim neon glow, his presence commanding absolute silence from the guards...',
                  style: TextStyle(fontSize: 16, color: Color(0xFFE0E0E0), height: 1.6),
                ),
              ],
            ),
          ),
          _buildAdSlot('GOOGLE AD SLOT (100% ADMIN REVENUE)'),
        ],
      ),
    );
  }

  Widget _buildWriterPortal() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('📝 Writer Dashboard', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amber)),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.amber),
            ),
            child: const Row(
              children: [
                Icon(Icons.warning, color: Colors.amber),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'NOTICE: Platform is 100% free. No upfront payments in Phase 1. All ad revenue goes to support expansion.',
                    style: TextStyle(color: Colors.amber, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Submission Rules:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('• Minimum 3 Chapters required.\n• Minimum 20,000 words required.\n• Approval takes up to 3 days.', style: TextStyle(color: Colors.grey, height: 1.5)),
          const Spacer(),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              minimumSize: const Size(double.infinity, 50),
            ),
            icon: const Icon(Icons.email, color: Colors.black),
            label: const Text('Contact Admin / Support Email', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            onPressed: () {
              // Simulated Email Trigger
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOwnerCalculator(double estimatedEarnings, double progress) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.between,
            children: [
              const Text('📈 RJ KING Revenue Panel', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.amber)),
              Text('${estimatedEarnings.toStringAsFixed(0)} PKR/mo', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 30),
          Text('Simulated Monthly App Traffic: ${_monthlyViews.toStringAsFixed(0)} views', style: const TextStyle(fontSize: 14)),
          Slider(
            value: _monthlyViews,
            min: 10000,
            max: 600000,
            activeColor: Colors.amber,
            onChanged: (val) {
              setState(() {
                _monthlyViews = val;
              });
            },
          ),
          const SizedBox(height: 20),
          Text('Phase 2 Milestone Progress: ${(progress * 100).toStringAsFixed(1)}%', style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 10),
          LinearProgressIndicator(value: progress, color: Colors.amber, backgroundColor: Colors.grey),
          const SizedBox(height: 20),
          if (progress >= 1.0)
            const Card(
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text('🎉 Milestone Achieved! You can now register RJ King Publishing Company!', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAdSlot(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.orange.withOpacity(0.05),
      child: Center(
        child: Text(
          '🔸 $label 🔸',
          style: const TextStyle(color: Colors.orange, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
    );
  }
