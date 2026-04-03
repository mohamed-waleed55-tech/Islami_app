import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islam/core/assets/colors/colors.dart';
import 'package:islam/core/assets/images/images_manager.dart';

import '../../../../core/constant_data/azkar.dart';

class TasbihTab extends StatefulWidget {
  const TasbihTab({super.key});

  @override
  State<TasbihTab> createState() => _TasbihTabState();
}

class _TasbihTabState extends State<TasbihTab>
    with SingleTickerProviderStateMixin {
  double angle = 0;
  int count = 0;

  String currentZkr = "الأذكار";

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _animation = AlwaysStoppedAnimation(angle);
  }

  void rotateSibha() {
    final newAngle = angle + (pi / 12);

    _animation = Tween<double>(
      begin: angle,
      end: newAngle,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward(from: 0);

    setState(() {
      angle = newAngle;
      count++;
    });
  }

  void changeZkr(String zkr) {
    setState(() {
      currentZkr = zkr;
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsManager.offWhite, size: 30),
        centerTitle: true,
        title: const Text(
          "الأذكار",
          style:  TextStyle(
            color: ColorsManager.offWhite,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagesManager.sibha_bg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: const Text(
                  "الأذكار",
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Amiri",
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: azkarList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: buildZkrItem(azkarList[index]),

                    onTap: () {
                      setState(() {
                        currentZkr = azkarList[index].zekr;
                        count = 0;
                      });
                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(6),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesManager.sibha_bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                fontSize: 34,
                color: ColorsManager.offWhite,
                fontFamily: "Amiri",
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 20),

            Text(
              currentZkr,
              style: TextStyle(
                fontSize: 28,
                color: ColorsManager.offWhite,
                fontFamily: "Amiri",
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 60),

            GestureDetector(
              onTap: rotateSibha,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(angle: _animation.value, child: child),

                      Container(
                        width: 90,
                        height: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "$count",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.gold,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                child: Image.asset(ImagesManager.sibha, width: 280),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildZkrItem(Azkar zkr) {
    return Column(
      children: [
        Text(
          zkr.zekr,
          style:const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorsManager.black,
            fontFamily: "Amiri",
          ),
          textDirection: TextDirection.rtl,
        ),
        Text(
          zkr.label,
          style: const TextStyle(
            fontSize: 14,
            color: ColorsManager.black,
            fontFamily: "Amiri",
          ),
          textDirection: TextDirection.rtl,
        ),
        const Divider(
          thickness: 1,
          endIndent: 20,
          indent: 20,
          color: ColorsManager.black,
        ),
      ],
    );
  }
}

class Azkar {
  final String zekr;
  final String label;

  Azkar({required this.zekr, required this.label});
}
