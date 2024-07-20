import 'package:favorites_app/item_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'items/items_provider.dart';
import 'favorites/favorites_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemsProvider);
    final favorites = ref.watch(favoritesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('あなたの趣味は?')),
      body: ListView.builder(
          itemBuilder: (context, index) {
            final item = items[index];
            // itemがfavoritesに含まれているかどうかを確認
            final isFavorite = favorites.valueOrNull?.contains(item) ?? false;
            return ListTile(
              leading: IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      ref.read(favoritesProvider.notifier).removeItem(item);
                    } else {
                      ref.read(favoritesProvider.notifier).addItem(item);
                    }
                  },
                  icon: isFavorite
                      ? const Icon(Icons.favorite, color: Colors.pink)
                      : const Icon(Icons.favorite_outline)),
              title: Text(items[index]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemDetailPage(item: item)),
                );
              },
            );
          },
          itemCount: items.length),
    );
  }
}
