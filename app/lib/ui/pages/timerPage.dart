import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gaji/constant/theme/styles.dart';
import 'package:gaji/provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class TimerPage extends HookConsumerWidget {
  const TimerPage({Key? key, this.todoId = ""}) : super(key: key);

  final String todoId;
  final duration = 60;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    final todo = ref
        .watch(todoListProvider)
        .where((todo) => todoId == todo.id)
        .toList()[0];

    final AnimationController controller = useAnimationController(
      duration: Duration(seconds: duration),
    );

    final ValueNotifier<int> time = useState<int>(0);
    final ValueNotifier<String> buttonText = useState<String>("Stop");

    void setTime() {
      time.value = (controller.value * duration).toInt();
    }

    void toggleAnimation(AnimationController controller) {
      if (controller.isAnimating) {
        controller.stop();
        buttonText.value = "Start";
        controller.removeListener(setTime);
      } else {
        controller.addListener(setTime);
        controller.repeat();
        buttonText.value = "Stop";
      }
    }

    useEffect(() {
      toggleAnimation(controller);
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned.fill(
              child: SizedBox(),
            ),
            SizedBox(
              width: size.width * 0.7,
              height: size.width * 0.7,
              child: CustomPaint(
                  painter: TimerPainter(
                animation: controller,
                backgroundColor: Colors.transparent,
                color: Colors.brown,
              )),
            ),
            Positioned(
              bottom: 150,
              child: Text(
                todo.description,
                style: const TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
            Text(
              "${time.value}",
              style: const TextStyle(color: Colors.brown, fontSize: 34),
            ),
            Positioned(
              bottom: 80,
              child: Row(
                children: [
                  OutlinedButton(
                    style: outlinedButtonStyle,
                    onPressed: () {
                      ref.read(todoListProvider.notifier).toggle(todo.id);
                      context.go('/');
                      controller.stop();
                    },
                    child: const Text(
                      "Done",
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    style: outlinedButtonStyle,
                    onPressed: () {
                      toggleAnimation(controller);
                    },
                    child: Text(
                      buttonText.value,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  TimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    const double pi = math.pi;
    const double sW = 34;
    final double cW = size.width;
    final double v = animation.value; // 0..1

    final double rad = v * 2 * pi;

    double mapTo(double from, double to) => (from + 1) * to / 2;

    double sX = mapTo(math.sin(rad + pi), cW);
    double sY = mapTo(-math.cos(rad + pi), cW);
    double eX = mapTo(math.sin(rad), cW);
    double eY = mapTo(-math.cos(rad), cW);

    Offset gradStart = Offset(sX, sY);
    Offset gradEnd = Offset(eX, eY);

    Paint paint = Paint()
      ..strokeWidth = sW
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader =
          ui.Gradient.linear(gradStart, gradEnd, [backgroundColor, color]);

    canvas.drawArc(rect, rad, pi * 2, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}
