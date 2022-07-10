import 'package:bloc_toolkit/widgets.dart';
import 'package:flutter/material.dart';

import 'add_cubit.dart';

class AddCubitErrorHandler extends StatelessWidget {
  final Widget child;

  const AddCubitErrorHandler({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocHandleError<AddCubit, AddState>(
      child: child,
    );
  }
}
