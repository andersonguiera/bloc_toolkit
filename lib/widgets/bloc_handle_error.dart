import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/base_bloc_state.dart';

class BlocHandleError<B extends BlocBase<S>, S extends BaseBlocState>
    extends StatelessWidget {
  final Widget child;

  const BlocHandleError({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listenWhen: (previous, current) => current.isException,
      listener: (context, state) =>
          _showMessage(context, state.exception.toString(), state.retry!),
      child: child,
    );
  }

  void _showMessage(
      BuildContext context, String message, void Function() retry) {
    showDialog(
        context: context,
        builder: (_) => _Alert(
          message: message,
          retry: retry,
        ));
  }
}

class _Alert extends StatelessWidget {
  final String message;
  final void Function() retry;

  const _Alert({Key? key, required this.message, required this.retry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: [
        TextButton(onPressed: retry, child: const Text('TRY AGAIN'))
      ],
    );
  }
}
