import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void getSizeAndPosition({
    required GlobalKey widgetKey,
  }) {
    RenderBox renderBox =
        widgetKey.currentContext?.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset position = renderBox.localToGlobal(Offset.zero);

    print("Kích thước của widget: $size");
    print("Vị trí trên màn hình: $position");
  }

  final GlobalKey one = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            getSizeAndPosition(widgetKey: one);
          }),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          key: one,
                          height: 40,
                          width: 40,
                          color: Colors.blueAccent,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          color: Colors.blueAccent,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 160,
                    width: double.infinity,
                    color: Colors.greenAccent,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          color: Colors.blueGrey,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          color: Colors.redAccent,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          color: Colors.white10,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          color: Colors.amber,
                        )
                      ],
                    )),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.yellowAccent,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.transparent;

    // Vẽ hình chữ nhật đen để che phủ toàn bộ màn hình
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Tạo một path để vẽ lỗ trống
    Path path = Path()
      ..addRect(const Rect.fromLTWH(50, 50, 100, 100))
      ..fillType = PathFillType.evenOdd;

    // Đặt màu fill cho lỗ trống là màu đen
    paint.color = Colors.black;

    // Vẽ lỗ trống
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
