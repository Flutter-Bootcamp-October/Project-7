import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapey_bloc.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_event.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_state.dart';
import 'package:therapiest_ai/consts/colors.dart';
import 'package:therapiest_ai/services/extentions.dart';
import 'package:therapiest_ai/views/chat_screen.dart';
import 'package:therapiest_ai/views/regestration_screen.dart';
import 'package:therapiest_ai/widget/my_button_widget.dart';
import 'package:therapiest_ai/widget/therapist_card_widget.dart';

class TherapistsScreen extends StatelessWidget {
  const TherapistsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.removeUnitl(const RegestrationScreen());
            },
            icon: const Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                if (context.locale.toString() == "en_US") {
                  context.setLocale(const Locale('ar', 'SA'));
                } else {
                  context.setLocale(const Locale('en', 'US'));
                }
              },
              icon: const Icon(Icons.translate)),
        ],
        title: Text('TherapistScreen.choiceStatement'.tr()),
        backgroundColor: scaffoldColor2,
      ),
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TherapistCard(isSara: true, contexState: context.locale),
            const SizedBox(height: 10),
            TherapistCard(isSara: false, contexState: context.locale),
            const SizedBox(height: 20),
            FittedBox(
              child: Row(children: [
                BlocBuilder<TherapyBloc, TherapyState>(
                  builder: (context, state) {
                    if (state is UpdateLanguageSelection) {
                      isSelected = state.isArabic;
                    }
                    return Checkbox(
                        checkColor: Colors.black,
                        activeColor: checkColor,
                        value: isSelected,
                        onChanged: (value) {
                          isSelected = !isSelected;
                          context
                              .read<TherapyBloc>()
                              .add(UserSetLanguageEvent(isArabic: isSelected));
                        });
                  },
                ),
                Text('TherapistScreen.therapistLang'.tr(),
                    style: const TextStyle(fontWeight: FontWeight.w500))
              ]),
            ),
            MyButton(
                w: 300,
                onPressed: () {
                  context.pushScreen(const ChatScreen());
                },
                child: Text('TherapistScreen.therapistButton'.tr())),
          ],
        ),
      ),
    );
  }
}
