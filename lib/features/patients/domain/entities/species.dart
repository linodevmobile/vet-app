import 'package:vet_app/design_system/tokens/tokens.dart';

enum Species {
  dog(asset: DsAssets.speciesDog),
  cat(asset: DsAssets.speciesCat),
  exotic(asset: DsAssets.speciesExotic);

  const Species({required this.asset});

  final String asset;
}
