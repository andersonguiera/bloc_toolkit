import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../base/base_bloc_state.dart';
import '../l10n/localizations/app_localizations.dart';

class BlocHandleError<B extends BlocBase<S>, S extends BaseBlocState>
    extends StatelessWidget {

  /// A child widget
  final Widget child;

  /// An widget to show exceptions reported by [BaseBlocState.exception] and retry
  /// last operation when passed by [BaseBlocState.retry]
  /// BaseBlocHandler has an [child] widget.
  /// ``` dart
  /// MyParentWidget(
  ///   child: BlocHandleError&lt;MyBloc, MyBlocState&gt;(
  ///     child: MyChildWidget(),
  ///   ),
  /// );
  /// ```

  const BlocHandleError({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<B, S>(
      listenWhen: (previous, current) => current.isException,
      listener: (context, state) =>
          _showMessage(context, state.exception.toString(), state.retry),
      child: child,
    );
  }

  /// Show an alert window.
  void _showMessage(
      BuildContext context, String message, void Function()? retry) {
    showDialog(
        context: context,
        builder: (_) => _Alert(
              message: message,
              retry: retry,
            ));
  }
}

/// An Alert window class that show an [message] error and build a TRY AGAIN
/// button if [retry] callback function is present.
class _Alert extends StatelessWidget {
  /// A message to shows
  final String message;
  /// A callback function
  final void Function()? retry;

  const _Alert({Key? key, required this.message, required this.retry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = BlocToolkitLocalizations.of(context);
    final tryAgainButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          retry!();
        },
        child: Text(localizations?.tryAgainButton ?? 'TRY AGAIN'));
    final okButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(localizations?.okButton ?? 'OK'));
    final cancelButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(localizations?.cancelButton ?? 'CANCEL'));

    final actions = retry != null ? [tryAgainButton, cancelButton] : [okButton];

    return AlertDialog(
      title: Text(localizations?.errorLabel ?? 'Error!'),
      content: Text(message),
      actions: actions,
    );
  }
}
