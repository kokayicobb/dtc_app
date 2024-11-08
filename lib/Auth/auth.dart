import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> signInAnonymously() async {
  try {
    final supabase = Supabase.instance.client;
    final user = supabase.auth.currentUser;
    
    // Only sign in if there's no current user
    if (user == null) {
      final response = await supabase.auth.signInAnonymously();
      
      if (response.user != null) {
        debugPrint('Successfully signed in anonymously: ${response.user!.id}');
      }
    }
  } catch (e) {
    debugPrint('Error signing in anonymously: $e');
  }
}
Future<bool> checkFirstTimeUser() async {
  try {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser?.id;
    
    if (userId == null) return true;
    
    final response = await supabase
      .from('fit_calculator')
      .select()
      .eq('user_id', userId)
      .single();  // Remove .execute()
      
    // If we get here, data exists for the user
    return false;
    
  } catch (e) {
    // If we get a PostgrestError, it means no data was found
    debugPrint('No existing data found or error: $e');
    return true;
  }
}
