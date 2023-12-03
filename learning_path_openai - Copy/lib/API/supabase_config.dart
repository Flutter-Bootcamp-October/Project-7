import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future supabaseConfig() async {
  await Supabase.initialize(
      url: dotenv.env['URL']!, anonKey: dotenv.env['service_rolesecret']!);
}
