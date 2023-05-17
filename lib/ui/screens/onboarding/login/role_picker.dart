import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';

class RolePickerScreen extends StatefulWidget {
  const RolePickerScreen({super.key});

  static Future<void> push(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const RolePickerScreen(),
      ),
    );
  }

  @override
  State<RolePickerScreen> createState() => _RolePickerScreenState();
}

class _RolePickerScreenState extends State<RolePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CmoAppBar(
        title: 'User Roles',
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 38),
            alignment: Alignment.centerLeft,
            color: context.colors.blueDark1,
            child: Text(
              'Please Pick Your Role',
              style: context.textStyles.bodyBold
                  .copyWith(color: context.colors.white),
            ),
          ),
          _EntityCard(
            'Behave',
            onTap: () async {
              Navigator.pop(context, 'Behave');
            },
          ),
          Divider(
            height: 1,
            color: context.colors.grey,
            indent: 23,
            endIndent: 23,
          ),
          _EntityCard(
            'Perform',
            onTap: () async {
              Navigator.pop(context, 'Perform');
            },
          ),
        ],
      ),
    );
  }
}

class _EntityCard extends StatelessWidget {
  const _EntityCard(this.text, {required this.onTap, super.key});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CmoTappable(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(33, 12, 33, 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: context.textStyles.bodyBold
                      .copyWith(color: context.colors.black),
                ),
                Assets.icons.icArrowRight.svgBlack
              ],
            ),
          ],
        ),
      ),
    );
  }
}
