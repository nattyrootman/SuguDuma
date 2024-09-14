import 'package:flutter/material.dart';

class SettingListTitle extends StatelessWidget {
  final String title;
  final String subtile;

  final Widget leading;
  final Widget? trailing;
  final VoidCallback onTap;

  const SettingListTitle({
    super.key,
    required this.title,
    required this.subtile,
    required this.leading,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: leading,
        title: Text(title),
        subtitle: Text(subtile, style: Theme.of(context).textTheme.bodySmall),
        trailing: trailing);
  }
}
