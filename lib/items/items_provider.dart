import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'items_provider.g.dart';

// 型, プロバイダー名, プロバイダーの型
@riverpod
List<String> items(ItemsRef ref) {
  return [
    'アニメ',
    'グルメ',
    '不動産',
    'ニュース',
    '映画',
    '音楽',
    'スポーツ',
    'テクノロジー',
  ];
}
