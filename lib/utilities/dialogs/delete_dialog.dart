import 'package:flutter/cupertino.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Delete',
    content: 'Are your dure you want to delete this item?',
    optionsBuilder: () => {
      'Cancel': false,
      'Yes':true,
    },
  ).then((value) => value ?? false);
}
