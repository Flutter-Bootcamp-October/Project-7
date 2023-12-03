import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_path_openai/API/supabase_config.dart';
import 'package:learning_path_openai/Bloc/app_bloc/app_bloc.dart';
import 'package:learning_path_openai/Bloc/theme_bloc/app_bloc.dart';
import 'package:learning_path_openai/Bloc/theme_bloc/app_state.dart';
import 'package:learning_path_openai/view/logo_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  supabaseConfig();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is GetThemeState) {
            return MaterialApp(
              theme: state.themeData,
              debugShowCheckedModeBanner: false,
              home: const LogoView(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
