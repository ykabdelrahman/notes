import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_icon_button.dart';

class NotesAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const NotesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Notes'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CustomIconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
