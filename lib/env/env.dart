import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'GoogleApiKey', obfuscate: true)
  static const String googleApiKey = _Env.GoogleApiKey;
}
