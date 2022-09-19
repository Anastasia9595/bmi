import 'package:bmi_calculator/cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
    required this.color,
    required this.elevation,
    required this.styles,
  });

  final String name;
  final AssetImage image;
  final Function onTap;
  final double elevation;

  final Color color;
  final TextStyle styles;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          return Card(
            color: color,
            margin: const EdgeInsets.only(left: 10, right: 10),
            elevation: elevation,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: image,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      name,
                      style: styles,
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}
