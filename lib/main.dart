import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final imageList = <String>[
      'assets/images/1.jpg',
      'assets/images/2.jpg',
      'assets/images/3.jpg',
      'assets/images/4.jpg',
      'assets/images/5.jpg',
      'assets/images/6.jpg',
      'assets/images/7.jpg',
      'assets/images/8.jpg',
      'assets/images/9.jpg',
      'assets/images/10.jpg',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('🐵🐵TK List & GridView🍌🍌'),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            // GridView ครึ่งบน
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  itemCount: imageList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.orange, width: 2),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          imageList[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Center(child: Text("🖼️")),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // เส้นแบ่งสีส้มบาง ๆ
            Container(
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.yellow.shade300, Colors.orange.shade600],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 100, // จำนวน emoji เยอะๆ ให้เต็มจอ
                  itemBuilder: (context, index) {
                    // สลับกล้วย 🍌 กับลิง 🐒
                    String emoji = (index % 2 == 0) ? '🍌' : '🐒';
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                      child: Text(
                        emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                    );
                  },
                ),
              ),

            // ListView ครึ่งล่าง
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 20,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.orange,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        'รายการที่ ${index + 1}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      leading: Text(
                          (index % 2 == 0) ? '🍌' : '🐒',
                          style: const TextStyle(fontSize: 24), // ปรับขนาดได้ตามชอบ
                        ),
                      trailing:
                          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.orange),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
