import 'package:flutter/material.dart';
import '../core/show_toast.dart';
import 'my_colors_icons.dart';
import 'theme_storage_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/cubit/theme_cubit.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  final int value;
  const ChangeThemeButtonWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    bool oneTimeTry = true;
    if (value == 1 && oneTimeTry) {
      oneTimeTry = false;
      try {
        StorageManager.readData('themeMode').then((value) {
          if (value == "system") {
            theme.changeTheme(0);
          } else if (value == "light") {
            theme.changeTheme(1);
          } else {
            theme.changeTheme(-1);
          }
        });
      } catch (e) {
        showToast(e.toString());
      }
    }
    return IconButton(
      style: ElevatedButton.styleFrom(
        side: MyColorsIcons.outlineBorder,
        minimumSize: const Size(120, 40),
        backgroundColor: Colors.black,
      ),
      onPressed: () {
        if (theme.themeMode == ThemeMode.system) {
          theme.changeTheme(-1);
        } else if (theme.themeMode == ThemeMode.dark) {
          theme.changeTheme(1);
        } else {
          theme.changeTheme(0);
        }
      },
      icon: theme.icon,
    );
  }
}
