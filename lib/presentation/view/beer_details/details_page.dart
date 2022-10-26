import 'package:beerville_flutter/domain/models/beer.dart';
import 'package:beerville_flutter/presentation/base/widget_appbar.dart';
import 'package:beerville_flutter/presentation/res/beer_strings.dart';
import 'package:beerville_flutter/presentation/view/beer_details/bloc/details_page_event.dart';
import 'package:beerville_flutter/presentation/view/beer_details/bloc/widgets/widget_beer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/details_page_bloc.dart';

class DetailsPage extends StatelessWidget {
  final Beer beer;

  const DetailsPage({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsPageBloc>(
      create: (context) =>
          DetailsPageBloc()..add(LoadingDetailsPageEvent(beer)),
      child: Scaffold(
        appBar: WidgetAppBar(
          mainText: BeerStrings.beerPage,
          isBackRequired: true,
          isActionsRequired: true,
        ),
        body: WidgetBeerDetails(),
      ),
    );
  }
}
