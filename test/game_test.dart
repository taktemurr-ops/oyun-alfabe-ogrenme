import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_alfabe_ogrenme/oyun_alfabe_ogrenme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(alfabeOgrenmeConfig.title.length, 33);
    expect(alfabeOgrenmeConfig.tagline.length, 33);
    for (final s in alfabeOgrenmeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(alfabeOgrenmeConfig.gameId, alfabeOgrenmeId);
    expect(alfabeOgrenmeRules.gameId, alfabeOgrenmeId);
    expect(alfabeOgrenmeConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(alfabeOgrenmeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: alfabeOgrenmeId, optionalMechanics: alfabeOgrenmeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(alfabeOgrenmeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
