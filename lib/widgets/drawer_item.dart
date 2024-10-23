import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final Icon asset;
  final bool isSelected;
  final VoidCallback? onTap;

  const DrawerItem(
      {Key? key,
        required this.title,
        required this.asset,
        required this.onTap,
        required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
            dense: true,
            leading: asset,
            title: Text(
              title,
              style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor),
            ),
            trailing: isSelected
                ? const Icon(
              Icons.check_circle,
              color: AppColors.ratingIconColor,
            )
                : null),
      ),
    );
  }
}
