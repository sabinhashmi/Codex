// main.dart or config.dart
final supabaseUrl = const String.fromEnvironment('SUPABASE_URL', defaultValue: '');
final supabaseAnonKey = const String.fromEnvironment('SUPABASE_ANON_KEY', defaultValue: '');


flutter build web --release \
  --dart-define=SUPABASE_URL=https://your-supabase-url \
  --dart-define=SUPABASE_ANON_KEY=your-anon-key
