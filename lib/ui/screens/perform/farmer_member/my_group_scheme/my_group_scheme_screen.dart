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
            Html(
              data: html,
              onLinkTap: (
                url,
                attributes,
                element,
              ) async {
                final hasInternet = await NetworkUtils.hasInternet();
                if (hasInternet) {
                  print(url);
                  await CommonFunctions.openUrl(url);
                } else {
                  showSnackError(msg: LocaleKeys.you_dont_have_internet_connection.tr());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

String html = """<div class="EmpowerSnippet">
    <div class="header">
        <h1>Documents</h1>
        <p>Please find some usefule information below</p>
    </div>
    <div>
        <a href="https://vnexpress.net/">Onboarding Document</a>
    </div>
    <div>
        <a href="https://vnexpress.net/">Help Document</a>
    </div>
    <div>
        <a href="https://vnexpress.net/">FSC Standard</a>
    </div>
    <div class="header">
        <h1>Videos</h1>
        <a href="https://youtube.com/xyz">
            <img src="https://thumbnail_link.com" alt="" class="snippet_thumbnail">
            <p>COC Training</p>
        </a>
        <a href="https://youtube.com/xys">
            <img src="https://thumbnail_link2.com" alt="" class="snippet_thumbnail">
            <p>Chainsaw Training</p>
        </a>
    </div>
</div>""";