import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rnm_t/presentation/blocs/home/home_tabs_cubit.dart';

class MainTabButton extends StatelessWidget {
  final MainTab groupValue;
  final MainTab value;
  final IconData icon;
  final String text;

  const MainTabButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        groupValue != value ? Colors.white.withOpacity(0.6) : Colors.white;

    return Expanded(
      child: ElevatedButton(
        onPressed: () => context.read<MainTabsCubit>().setTab(value),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 10),
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 25,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
