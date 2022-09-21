import 'package:bmi_calculator/cubit/person_list_cubit.dart';
import 'package:bmi_calculator/view/home/home.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/person_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/bmi_cubit.dart';

class PersonListPage extends StatelessWidget {
  const PersonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final statebmi = context.watch<BmiCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: SafeArea(
        child: BlocBuilder<PersonListCubit, PersonListState>(
          builder: ((context, state) {
            return ListView.builder(
              itemCount: state.personList.length,
              itemBuilder: (context, index) {
                return PersonCard(
                    name: state.personList[index].name,
                    bmiResult: state.personList[index].bmiResult,
                    id: state.personList[index].id);
              },
            );
          }),
        ),
      ),
    );
  }
}
