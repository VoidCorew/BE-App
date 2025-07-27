import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Продукты', style: TextStyle(fontFamily: 'Nunito')),
      ),
      body: const Center(
        child: Text(
          'Пока еще не добавлено',
          style: TextStyle(fontFamily: 'Nunito'),
        ),
      ),
    );
  }
}
