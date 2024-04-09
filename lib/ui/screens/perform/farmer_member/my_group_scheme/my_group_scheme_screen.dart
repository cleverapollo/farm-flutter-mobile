import 'package:cmo/extensions/string.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/state/state.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class MyGroupSchemeScreen extends BaseStatefulWidget{
  const MyGroupSchemeScreen(): super(screenName: 'MyGroupSchemeScreen');

  static void push(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BlocProvider(
            create: (_) => MyGroupSchemeCubit(),
            child: const MyGroupSchemeScreen(),
          );
        },
      ),
    );
  }

  @override
  State<MyGroupSchemeScreen> createState() => MyGroupSchemeScreenState();
}

class MyGroupSchemeScreenState extends BaseStatefulWidgetState<MyGroupSchemeScreen> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBar(
        title: LocaleKeys.empower.tr(),
        leading: Assets.icons.icBackButton.svgBlack,
        onTapLeading: onShowWarningDispose,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<MyGroupSchemeCubit, MyGroupSchemeState>(
              builder: (context, state) {
                if (state.groupSchemeContentLibrary?.content == null ||
                    state.groupSchemeContentLibrary!.content.isBlank) {
                  return const SizedBox.shrink();
                }

                return Html(
                  data: state.groupSchemeContentLibrary?.content,
                  onLinkTap: (
                    url,
                    attributes,
                    element,
                  ) async {
                    final hasInternet = await NetworkUtils.hasInternet();
                    if (hasInternet) {
                      await CommonFunctions.openUrl(url);
                    } else {
                      showSnackError(msg: LocaleKeys.you_dont_have_internet_connection.tr());
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
