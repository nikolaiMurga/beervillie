import 'package:beerville_flutter/presentation/view/navigation/bloc/navigation_page_bloc.dart';
import 'package:beerville_flutter/presentation/view/navigation/bloc/navigation_page_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetPageContainer extends StatelessWidget {
  const WidgetPageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NavigationPageBloc, NavigationPageState>(
        builder: (context, state) => state.page,
      );
}
