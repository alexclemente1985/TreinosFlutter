import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class Releases extends StatelessWidget {
  const Releases({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //opção que evita o erro de tamanho indefinido ao usar uma lista
      slivers: [
        //depende do encapsulamento de widgets em SliverToBoxAdapter
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Image.asset("assets/upcoming.png", height: 80, width: 80),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Text(
              "Próximos Lançamentos",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) =>
              Padding(padding: EdgeInsets.only(bottom: 32), child: MovieCard()),
          itemCount: 10,
        ),
      ],
    );
  }
}