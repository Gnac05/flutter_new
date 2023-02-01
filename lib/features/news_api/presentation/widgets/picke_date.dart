import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/features/news_api/presentation/blocs/blocSortEverything/sort_everything_bloc.dart';

import '../../../../core/config/constant.dart';
import '../../../../core/config/di.dart';
import '../../../../core/model/app_model.dart';
import '../blocs/blocEverything/everything_bloc.dart';

class PickeDate extends StatelessWidget {
  const PickeDate({Key? key, required this.from}) : super(key: key);
  final String from;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: const Text(
              'Nouvel depuis',
              style: TextStyle(fontSize: 12),
            ),
            subtitle: Text(
              from,
              style: const TextStyle(fontSize: 9),
            ),
            onTap: () async {
              DateTime? dateTime = await showDatePicker(
                cancelText: 'Retourner',
                confirmText: 'Confirmer',
                helpText: 'Selectionner une date',
                // locale: const Locale('fr'),
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now());
              if (dateTime != null) {
                final from =dateTime.toString().substring(0,10);
                context.read<SortEverythingFromBloc>().add(EverythingFrom(from: from));
                context.read<EverythingBloc>().add( BlocEventEverything(getIt<AppModel>().getEverythingQ()??'Bénin', languages[getIt<AppModel>().getLanguage()?? 0], from));
                
              }
            },
          ),
        ),
      ),
    );
  }
}
