import 'package:beerville_flutter/presentation/base/widget_progress_indicator.dart';
import 'package:beerville_flutter/presentation/tools/build_context_extensions.dart';
import 'package:beerville_flutter/presentation/view/beer_card/beer_card.dart';
import 'package:beerville_flutter/presentation/view/main/bloc/main_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/main/bloc/main_page_event.dart';
import 'package:beerville_flutter/presentation/view/main/bloc/main_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetBeersList extends StatelessWidget {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final _mainPageBloc = context.bloc<MainPageBloc>();
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        if (state is LoadingMainPageState) {
          return WidgetProgressIndicator();
        }
        if (state is LoadedMainPageState) {
          return NotificationListener<ScrollEndNotification>(
            child: ListView.separated(
              controller: _controller,
              itemCount: state.beerList.length,
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: 15),
              ),
              itemBuilder: (context, index) => BeerCard(state.beerList[index]),
            ),
            onNotification: (ScrollEndNotification notification) {
              if (notification is ScrollEndNotification) {
                if (_controller.position.extentAfter == 0)
                  _mainPageBloc.add(NextPageScrollEvent());
              }
              if (notification is ScrollEndNotification) {
                if (_controller.position.extentBefore == 0)
                  _mainPageBloc.add(PreviousPageScrollEvent());
              }
              return false;
            },
          );
        }
        if (state is ErrorMainPageState) {
          return Center(child: Text('ERROR'));
        }
        return Text('NO DATA');
      },
    );
  }
}
