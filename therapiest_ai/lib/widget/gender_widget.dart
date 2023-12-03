import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapey_bloc.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_event.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_state.dart';
import 'package:therapiest_ai/consts/colors.dart';
import 'package:therapiest_ai/global/globals.dart';

class GenderChoiceChip extends StatelessWidget {
  const GenderChoiceChip({
    super.key,
    required this.gender,
  });
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          context
              .read<TherapyBloc>()
              .add(UserGenderSelectionEvent(choice: gender));
        },
        child: BlocBuilder<TherapyBloc, TherapyState>(
          builder: (context, state) {
            return Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                    color:
                        currentUserGender == gender ? checkColor : Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Image.asset('assets/images/$gender.png'));
          },
        ),
      ),
    );
  }
}
