import 'package:flutter/foundation.dart';
import 'package:gaji/controllers/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:gaji/provider/state.dart';
import 'package:gaji/provider/color.dart';
import 'package:gaji/provider/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final addTodoKey = UniqueKey();

class AddTodoInput extends HookConsumerWidget {
  const AddTodoInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color bnw = ref.watch(bnwColorProvider.state).state;
    final Color brown = ref.watch(brownPrimaryColorProvider.state).state;

    final StateController focusStateController =
        ref.watch(focustStateControllerProvider.state);
    final bool hasFocus = focusStateController.state;

    final Size size = MediaQuery.of(context).size;
    final AnimationController rotationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final TextEditingController addTodoTextEditingController =
        useTextEditingController();
    final TodoController todoController = ref.watch(todoControllerProvider);
    final FocusNode addTodoFocus = useFocusNode();

    void setFocusState() {
      focusStateController.state = addTodoFocus.hasFocus;
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

      hasFocus
          ? () {
              addTodoTextEditingController.value.text.trim().isEmpty
                  ? null
                  : todoController.put(
                      addTodoTextEditingController.value.text, isToday);
              FocusManager.instance.primaryFocus?.unfocus();
              addTodoTextEditingController.clear();
              focusStateController.state = false;
            }()
          : () {
              focusStateController.state = true;
              if (kDebugMode) {
                print("${addTodoFocus.hasFocus}");
              }
              addTodoFocus.requestFocus();
            }();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOutSine,
      width: hasFocus ? size.width * 0.9 : 55,
      height: hasFocus ? 120 : 55,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          hasFocus
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      ToggleButtons(
                          selectedColor: bnw,
                          color: brown,
                          fillColor: bnw.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(50),
                          borderColor: bnw.withOpacity(0.2),
                          selectedBorderColor: bnw.withOpacity(0.2),
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 13.0, right: 8.0),
                              child: Text(
                                "Today",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0, right: 13.0),
                              child: Text(
                                "Tomorrow",
                              ),
                            ),
                          ],
                          onPressed: (index) {
                            final isSelected = ref
                                .watch(todayOrTomorrowSelectProvider.notifier);

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
                          isSelected: ref.watch(todayOrTomorrowSelectProvider)),
                    ],
                  ),
                )
              : const SizedBox(),
          Row(
            children: [
              Flexible(
                child: TextField(
                  cursorColor: bnw.withOpacity(0.8),
                  key: addTodoKey,
                  textAlignVertical: TextAlignVertical.center,
                  controller: addTodoTextEditingController,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: hasFocus
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: bnw.withOpacity(0.2)))
                        : null,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: bnw.withOpacity(0.2)),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  ),
                  focusNode: addTodoFocus,
                  onSubmitted: (_) {
                    addTodoItem();
                  },
                ),
              ),
              SizedBox(
                width: 50,
                height: 50,
                child: Material(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: hasFocus
                              ? Colors.transparent
                              : bnw.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(8)),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onTap: addTodoItem,
                    child: RotationTransition(
                      turns: Tween(begin: 0.125, end: 0.25)
                          .animate(rotationController),
                      child: const Icon(
                        LineIcons.times,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
