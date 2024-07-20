import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'favorites/favorites_provider.dart';

class ItemDetailPage extends ConsumerWidget {
  const ItemDetailPage({required this.item, super.key});

  final String item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider);
    final isFavorite = favorites.valueOrNull?.contains(item) ?? false;
    return Scaffold(
        appBar: AppBar(
          title: Text(item),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$itemの詳細画面', style: const TextStyle(fontSize: 24)),
            IconButton(
              onPressed: () {
                if (isFavorite) {
                  ref.read(favoritesProvider.notifier).removeItem(item);
                } else {
                  ref.read(favoritesProvider.notifier).addItem(item);
                }
              },
              icon: isFavorite
                  ? Icon(Icons.favorite, size: 50, color: Colors.pink)
                  : Icon(Icons.favorite_outline, size: 50),
            )
          ],
        )));
  }
}
