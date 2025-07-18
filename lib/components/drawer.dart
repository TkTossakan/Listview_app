import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listview_app/gallery.dart';
import 'package:listview_app/list.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF9C4), Color(0xFFFFF59D)], // โทนกล้วยแบบอบอุ่น
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFFD54F), // สีเหลืองกล้วยเข้มๆ
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'ยินดีต้อนรับเจ้าลิงน้อย 🍌',
                  style: TextStyle(
                    color: Color(0xFF4E342E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Text('🏡', style: TextStyle(fontSize: 20)),
              title: const Text('หน้าแรก'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Text('🖼️', style: TextStyle(fontSize: 20)),
              title: const Text('แกลเลอรี่'),
              onTap: () {
                Get.to(() => const Gallery());
              },
            ),

            ListTile(
              leading: const Text('📦', style: TextStyle(fontSize: 20)),
              title: const Text('สินค้าทั้งหมด'),
              onTap: () {
                Get.to(() => const ListPage());
              },
            ),

            const Divider(thickness: 1, color: Color(0xFF8D6E63)),

            ListTile(
              leading: const Text('🚪', style: TextStyle(fontSize: 20)),
              title: const Text('ออกจากป่า'),
              onTap: () {
                Get.back(); // หรือจะใช้ Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
