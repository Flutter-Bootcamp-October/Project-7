import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage {
  uploadImage({required String pathImageLocal}) async {
    final supabase = Supabase.instance.client;
    await supabase.storage
        .from('img_app')
        .upload('/users/${DateTime.now()}.png', File(pathImageLocal));
  }
}