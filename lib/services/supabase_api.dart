import 'package:finance_app/globals/globals.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseApi {
  supabaseConnection() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(
      url: ' ',
      anonKey: ' ',
    );
  }

  SupabaseClient get supabaseObject {
    return Supabase.instance.client;
  }

  Future getFav() async {
    final data = await supabaseObject.from('favorite').select('*');
    print(data);

    for (var element in data) {
      fav.add(element['fav']);
    }
    return fav;
  }

  Future addToFav({
    required id,
    required String fav,
  }) async {
    await supabaseObject.from('favorite').insert(
      {
        'id': id,
        'fav': fav,
      },
    );
  }

  Future deleteFav({
    required int id,
  }) async {
    await supabaseObject.from('favorite').delete().match({
      'id': id,
    });
  }
}
