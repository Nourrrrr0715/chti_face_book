import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatageDate extends StatelessWidget {
  final DateTime date;

  const FormatageDate({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd MMM yyyy HH:mm', Localizations.localeOf(context).toString());
    return Text(df.format(date), style: Theme.of(context).textTheme.caption);
  }
}
