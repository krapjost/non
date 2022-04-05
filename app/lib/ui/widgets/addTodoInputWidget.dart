import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:non/i18n/strings.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

import 'package:non/controllers/todo.dart';
import 'package:non/provider/state.dart';

final addTodoKey = UniqueKey();

class AddTodoInput extends HookConsumerWidget {
  const AddTodoInput({Key? key, required this.addTodoFor}) : super(key: key);
  final String addTodoFor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final StateController focusStateController =
        ref.watch(focustStateControllerProvider.state);
    final bool hasFocus = focusStateController.state;
    final Size size = MediaQuery.of(context).size;
    final ColorScheme contextColor = Theme.of(context).colorScheme;

    final AnimationController rotationController = useAnimationController();
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
      hasFocus
          ? () {
              addTodoTextEditingController.value.text.trim().isEmpty
                  ? null
                  : todoController.put(
                      addTodoTextEditingController.value.text, addTodoFor);
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
      padding: const EdgeInsets.all(8),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutSine,
      width: hasFocus ? size.width : 80,
      /* height: hasFocus ? 120 : 55, */
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      color: contextColor.primary.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
                    key: addTodoKey,
                    controller: addTodoTextEditingController,
                    focusNode: addTodoFocus,
                    onSubmitted: (_) {
                      addTodoItem();
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 55,
                height: 55,
                child: Material(
                  elevation: hasFocus ? 0 : 1,
                  color: hasFocus ? Colors.transparent : contextColor.primary,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: hasFocus
                            ? Colors.transparent
                            : contextColor.onPrimary.withOpacity(0.3),
                      ),
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
