import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapey_bloc.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_event.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_state.dart';
import 'package:therapiest_ai/consts/colors.dart';

bool isCardSelected = false;
bool isCardChecked = false;
bool stateForSara = false;

class TherapistCard extends StatelessWidget {
  const TherapistCard({
    super.key,
    required this.isSara,
    required this.contexState,
  });
  final bool isSara;
  final Locale contexState;

  @override
  Widget build(BuildContext context) {
    context.setLocale(contexState);
    return BlocBuilder<TherapyBloc, TherapyState>(
      builder: (context, state) {
        if (state is UpdateTherapiestCard) {
          isCardSelected = state.colorCard;
          isCardChecked = state.isSpecalized;
          stateForSara = state.isSara;
        }
        return InkWell(
          onTap: () {
            isCardSelected = !isCardSelected;
            context.read<TherapyBloc>().add(UserSelectedSystemEvent(
                isSara: isSara,
                isSpecalized: isCardChecked,
                isCardSelected: isCardSelected));
          },
          child: Card(
              color: isCardSelected && (stateForSara == isSara)
                  ? checkColor2
                  : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: isSara
                      ? Image.asset('assets/images/sara.png')
                      : Image.asset('assets/images/ahmad.png'),
                  title: isSara
                      ? Text(
                          'TherapistScreen.saraTitle'.tr(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      : Text(
                          'TherapistScreen.ahmadTitle'.tr(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                  subtitle: Column(children: [
                    isSara
                        ? Text('TherapistScreen.saracard'.tr())
                        : Text('TherapistScreen.ahmadcard'.tr()),
                    FittedBox(
                      child: Row(children: [
                        Checkbox(
                            checkColor: Colors.black,
                            activeColor: checkColor,
                            value: isCardChecked && (stateForSara == isSara),
                            onChanged: (value) {
                              isCardChecked = !isCardChecked;
                              context.read<TherapyBloc>().add(
                                  UserSelectedSystemEvent(
                                      isSara: isSara,
                                      isSpecalized: isCardChecked,
                                      isCardSelected: isCardSelected));
                            }),
                        isSara
                            ? Text('TherapistScreen.checkboxSara'.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800))
                            : Text('TherapistScreen.checkboxAhmad'.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800))
                      ]),
                    ),
                  ]),
                ),
              )),
        );
      },
    );
  }
}
