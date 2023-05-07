import 'package:flutter/material.dart';
import 'package:pop_articles/core/utils/app_sizes.dart';
import 'package:pop_articles/core/utils/app_text_style.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final Function(int)? onDurationChanged;

  CustomAppBar({super.key, required this.title, this.onDurationChanged});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        widget.title,
        style:  TextStyle(
          color: Colors.black,
          fontSize: AppSizes.sp(16),
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        widget.onDurationChanged != null
            ? DropdownButton<int>(
                value: _value,
        style: medium12(context: context).copyWith(color: Colors.black),
                alignment: AlignmentDirectional.center,
                items:  [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('1 day',style: medium12(context: context),),
                  ),
                  DropdownMenuItem(
                    value: 7,
                    child: Text('7 days',style: medium12(context: context),),
                  ),
                  DropdownMenuItem(
                    value: 30,
                    child: Text('30 days',style: medium12(context: context),),
                  ),
                ],
                onChanged: (value) {
                  _value = value!;
                  setState(() {});

                  widget.onDurationChanged!(_value);
                },
                underline: Container(), // remove the underline
              )
            : Container(),
      ],
    );
  }
}
