import 'package:flutter/material.dart';
import 'package:yukparkir/utils/components/constans.dart';

class DashboardHeader extends StatelessWidget {
  final String greetings;
  const DashboardHeader({Key? key, required this.greetings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      automaticallyImplyLeading: false,
      floating: false,
      pinned: false,
      backgroundColor: ColorPallete.primary,
      leading: Container(
        margin: const EdgeInsets.only(left: Constans.padding),
        child: Image.asset(
          'assets/icon/app_logo.png',
          height: 50,
          width: 50,
        ),
      ),
      title: Text(
        greetings,
        style: Theme.of(context).textTheme.headline1?.copyWith(
              color: ColorPallete.white,
            ),
      ),
      actions: const [
        Icon(
          Icons.notifications,
          color: ColorPallete.white,
          size: 40,
        ),
      ],
    );
  }
}
