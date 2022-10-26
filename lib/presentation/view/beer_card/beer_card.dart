import 'package:beerville_flutter/domain/models/beer.dart';
import 'package:beerville_flutter/presentation/view/beer_card/bloc/beer_card_bloc.dart';
import 'package:beerville_flutter/presentation/view/beer_card/bloc/beer_card_event.dart';
import 'package:beerville_flutter/presentation/view/beer_card/widgets/widget_beer_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BeerCard extends StatelessWidget {
  final Beer beer;

  BeerCard(this.beer);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BeerCardBloc>(
      create: (context) => BeerCardBloc()..add(LoadingBeerCardEvent(beer)),
      child: WidgetBeerCard(),
    );
  }
}
