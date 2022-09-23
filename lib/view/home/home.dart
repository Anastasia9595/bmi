import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:bmi_calculator/view/bmi_details/bmi_details.dart';
import 'package:bmi_calculator/view/home/widgets/age_card.dart';
import 'package:bmi_calculator/view/home/widgets/height_card.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/bottom_button.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/hero_dialog_route.dart';
import 'package:bmi_calculator/view/home/widgets/helperWidgets/popup_card_user.dart';

import 'package:bmi_calculator/view/home/widgets/user_card.dart';
import 'package:bmi_calculator/view/home/widgets/weight_card.dart';
import 'package:bmi_calculator/view/personlist/persons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PersonListPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.list,
                  color: Colors.grey,
                ))
          ],
          title: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
                text: 'BMI',
                style: TextStyle(
                  color: Styles.textColorHeadline,
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' Calculator',
                    style: Styles.headLineStyle2,
                  ),
                ]),
          )),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<BmiCubit, BmiState>(
                      builder: (context, state) {
                        return UserCard(
                          onTap: () => context.read<BmiCubit>().setGender(Gender.female),
                          color: state.person.gender != Gender.female ? Colors.white : Styles.userCardColor,
                          elevation: state.person.gender != Gender.female ? 10 : 2,
                          name: 'Woman',
                          image: const AssetImage('assets/woman.png'),
                          styles: state.person.gender != Gender.female ? Styles.textStyleCard : Styles.textStyleCardTap,
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<BmiCubit, BmiState>(
                      builder: (context, state) {
                        return UserCard(
                          styles: state.person.gender != Gender.male ? Styles.textStyleCard : Styles.textStyleCardTap,
                          onTap: () => context.read<BmiCubit>().setGender(Gender.male),
                          color: state.person.gender != Gender.male ? Colors.white : Styles.userCardColor,
                          elevation: state.person.gender != Gender.male ? 10 : 2,
                          name: 'Man',
                          image: const AssetImage('assets/man.png'),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<BmiCubit, BmiState>(
                      builder: (context, state) {
                        return UserCard(
                          styles: state.person.gender != Gender.other ? Styles.textStyleCard : Styles.textStyleCardTap,
                          color: state.person.gender != Gender.other ? Colors.white : Styles.userCardColor,
                          elevation: state.person.gender != Gender.other ? 10 : 2,
                          onTap: () => context.read<BmiCubit>().setGender(Gender.other),
                          name: 'Other',
                          image: const AssetImage('assets/gender.png'),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: const [
                  HeightCard(),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: WeightCard(),
                  ),
                  Expanded(
                    child: AgeCard(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) {
                  return BottomButton(
                    onTap: () {
                      context.read<BmiCubit>().setBmiResult();
                      context.read<BmiCubit>().setBmiCategory();
                      final snackbar = SnackBar(
                        elevation: 12,
                        content: const Text(
                          'Please select a gender',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Styles.kBottomContainerColour,
                        shape: const StadiumBorder(),
                        behavior: SnackBarBehavior.floating,
                      );
                      if (state.person.gender == Gender.none) {
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      } else {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          context: context,
                          builder: (ctx) {
                            return const BMIDetail();
                          },
                        );
                      }
                    },
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
