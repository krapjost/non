import 'package:flutter/foundation.dart';
import 'package:gaji/controllers/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:gaji/provider/state.dart';
import 'package:gaji/provider/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final addTodoKey = UniqueKey();

class AddTodoInput extends HookConsumerWidget {
  const AddTodoInput({Key? key, required this.isOnEditing}) : super(key: key);

  final ValueNotifier isOnEditing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    final AnimationController rotationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final TextEditingController addTodoTextEditingController =
        useTextEditingController();
    final TodoController todoController = ref.watch(todoControllerProvider);
    final FocusNode addTodoFocus = useFocusNode();

    void setFocusState() {
      ref.read(isOnInputProvider.state).state = addTodoFocus.hasFocus;
      addTodoFocus.hasFocus
          ? rotationController.animateTo(1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut)
          : rotationController.animateTo(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
    }

    void rotateAddTodoButtonIcon() {
      addTodoTextEditingController.value.text.trim().isNotEmpty
          ? rotationController.animateTo(0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut)
          : rotationController.animateTo(1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
    }

    useEffect(() {
      addTodoFocus.addListener(setFocusState);
      addTodoTextEditingController.addListener(rotateAddTodoButtonIcon);
      return null;
    }, [addTodoFocus]);

    addTodoItem() {
      final bool isToday =
          ref.watch(todayOrTomorrowSelectProvider.notifier).state[0];

      isOnEditing.value // when input mode
          ? () {
              addTodoTextEditingController.value.text.trim().isEmpty
                  ? null
                  : todoController.put(
                      addTodoTextEditingController.value.text, isToday);
              FocusManager.instance.primaryFocus?.unfocus();
              addTodoTextEditingController.clear();
              isOnEditing.value = false;
            }()
          : () {
              isOnEditing.value = true;
              if (kDebugMode) {
                print("${addTodoFocus.hasFocus}");
              }
              addTodoFocus.requestFocus();
            }();
    }

    return Positioned(
      bottom: 10,
      right: 20,
      child: AnimatedContainer(
        alignment: Alignment.centerRight,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutSine,
        width: isOnEditing.value ? size.width * 0.9 : 50,
        height: isOnEditing.value ? 120 : 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isOnEditing.value
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        ToggleButtons(
                            selectedBorderColor: Colors.white70,
                            borderRadius: BorderRadius.circular(50),
                            selectedColor: Colors.white,
                            color: Colors.brown,
                            borderColor: Colors.white70,
                            children: const [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 13.0, right: 8.0),
                                child: Text(
                                  "Today",
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 8.0, right: 13.0),
                                child: Text(
                                  "Tomorrow",
                                ),
                              ),
                            ],
                            onPressed: (index) {
                              final isSelected = ref.watch(
                                  todayOrTomorrowSelectProvider.notifier);

                              for (int buttonIndex = 0;
                                  buttonIndex < isSelected.state.length;
                                  buttonIndex++) {
                                if (buttonIndex == index) {
                                  isSelected.state = [false, true];
                                } else {
                                  isSelected.state = [true, false];
                                }
                              }
                            },
                            isSelected:
                                ref.watch(todayOrTomorrowSelectProvider)),
                      ],
                    ),
                  )
                : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: TextField(
                    key: addTodoKey,
                    textAlignVertical: TextAlignVertical.center,
                    controller: addTodoTextEditingController,
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: isOnEditing.value
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.brown),
                            )
                          : null,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white70),
                      ),
                      hoverColor: Colors.white,
                      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    ),
                    focusNode: addTodoFocus,
                    onSubmitted: (_) {
                      addTodoItem();
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: isOnEditing.value
                        ? null
                        : Border.all(color: Colors.white70, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: addTodoItem,
                    child: RotationTransition(
                      turns: Tween(begin: 0.125, end: 0.25)
                          .animate(rotationController),
                      child: const Icon(
                        LineIcons.times,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
