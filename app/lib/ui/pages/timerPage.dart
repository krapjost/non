import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gaji/controllers/todo.dart';
import 'package:gaji/i18n/strings.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class TimerPage extends HookConsumerWidget {
  const TimerPage({Key? key, this.todoId = ""}) : super(key: key);

  final String todoId;
  final duration = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final ColorScheme themeColors = Theme.of(context).colorScheme;
    final t = Translations.of(context);

    final todo = ref
        .watch(todoControllerProvider)
        .all
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
        buttonText.value = t.reportIssue;
        controller.removeListener(setTime);
      } else {
        controller.addListener(setTime);
        controller.repeat();
        buttonText.value = t.pause;
      }
    }

    useEffect(() {
      toggleAnimation(controller);
      return null;
    }, []);

    return Scaffold(
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
                backgroundColor: themeColors.onPrimary.withOpacity(0.1),
                color: themeColors.secondary.withOpacity(0.7),
              )),
            ),
            Positioned(
              bottom: 150,
              child: Text(
                todo.description,
                style: const TextStyle(fontSize: 21),
              ),
            ),
            Text(
              "${time.value}",
              style: const TextStyle(fontSize: 34),
            ),
            Positioned(
              bottom: 80,
              child: Row(
                children: [
                  OutlinedButton(
                    onPressed: () {
                      ref.watch(todoControllerProvider).toggle(todo.id);
                      context.go('/');
                      controller.stop();
                    },
                    child: Text(
                      t.done,
                      style: TextStyle(
                          fontSize: 18,
                          color: themeColors.onPrimary.withOpacity(0.5)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {
                      toggleAnimation(controller);
                    },
                    child: Text(
                      buttonText.value,
                      style: TextStyle(
                          fontSize: 18,
                          color: themeColors.onPrimary.withOpacity(0.5)),
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
    final Rect rect = Offset(-size.width, -size.width * 1.5) & size * 3;
    const double pi = math.pi;
    final double cW = size.width * 4;
    final double v = animation.value; // 0..1

    final double rad = v * 2 * pi;
    final double endRad = rad + pi;

    double mapTo(double from, double to) => (from + 1) * to / 2;

    double sX = mapTo(math.sin(rad), cW);
    double sY = mapTo(-math.cos(rad), cW);
    double eX = mapTo(math.sin(endRad), cW);
    double eY = mapTo(-math.cos(endRad), cW);

    Offset gradStart = Offset(sX, sY);
    Offset gradEnd = Offset(eX, eY);

    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader =
          ui.Gradient.linear(gradStart, gradEnd, [backgroundColor, color]);

    canvas.drawArc(rect, rad * v, pi * 2, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value ||
        color != oldDelegate.color ||
        backgroundColor != oldDelegate.backgroundColor;
  }
}
