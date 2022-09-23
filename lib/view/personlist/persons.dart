import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/cubit/person_list_cubit.dart';
import 'package:bmi_calculator/view/home/home.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/person_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants.dart';

class PersonListPage extends StatelessWidget {
  const PersonListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: (() {
              context.read<BmiCubit>().clearInfo();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            }),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          'List of persons',
          style: TextStyle(
            color: Styles.textColorHeadline,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<PersonListCubit, PersonListState>(
          builder: ((context, state) {
            return ListView.builder(
              itemCount: state.personList.length,
              itemBuilder: (context, index) {
                return PersonCard(
                    name: state.personList[index].name,
                    bmi: state.personList[index].bmi,
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
