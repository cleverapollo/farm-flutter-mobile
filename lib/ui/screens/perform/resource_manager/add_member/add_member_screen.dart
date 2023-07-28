import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/gen/assets.gen.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/data/province.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/ui/components/select_site_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_membership_contract_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/farm_member_objectives_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_chip_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_collapse_title_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/slimf_and_mpo_section.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:cmo/ui/widget/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key, this.farm});

  final Farm? farm;

  static Future<bool?> push(BuildContext context, {Farm? farm}) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => AddMemberScreen(farm: farm),
      ),
    );
  }

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  late final AddMemberCubit cubit;
  late final DashboardCubit dashboardCubit;

  @override
  void dispose() {
    cubit.stepCount();
    dashboardCubit.getResourceManagerMembers();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    dashboardCubit = context.read<DashboardCubit>();
    Future.microtask(() async {
      await context.read<AddMemberCubit>().initAddMember(farm: widget.farm);
      cubit = context.read<AddMemberCubit>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.addMember.tr(),
        showTrailing: true,
        onTapTrailing: () {
          Navigator.pop(context, true);
        },
      ),
      body: BlocSelector<AddMemberCubit, AddMemberState, bool>(
        selector: (state) => state.isLoading,
        builder: (context, bool isLoading) {
          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: context.colors.blueDark2,
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                SlimfAndMpoSection(),
                const SizedBox(height: 12),
                _AddMemberMDetails(),
                SizedBox(height: 12),
                _AddMemberSDetails(),
                SizedBox(height: 12),
                _AddMemberInclusionDate(),
                SizedBox(height: 12),
                _AddMemberMRA(),
                SizedBox(height: 12),
                FarmMemberObjectivesWidget(),
                SizedBox(height: 12),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AddMemberInclusionDate extends StatelessWidget {
  const _AddMemberInclusionDate();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberInclusionDate>(
      selector: (state) => state.addMemberInclusionDate,
      builder: (context, AddMemberInclusionDate data) {
        final cubit = context.read<AddMemberCubit>();
        return CmoCollapseTitle(
          showTick: data.isComplete,
          title: 'Member Inclusion Date',
          child: ColoredBox(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Member Inclusion Date',
                    style: context.textStyles.bodyBold
                        .copyWith(color: const Color(0xff2072B9)),
                  ),
                  _buildDivider(),
                  Text(
                    'The date when the member will be included into Group Scheme',
                    style: context.textStyles.bodyNormal
                        .copyWith(color: Colors.black),
                  ),
                  InkWell(
                    onTap: () async {
                      final result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.parse(data.inclusionDate ??
                              DateTime.now().toIso8601String()),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2200));

                      await cubit.onDataChangeInclusionDate(result);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10, left: 6, right: 6, top: 4),
                      padding:
                          const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data.inclusionDate != null
                                ? DateTime.parse(data.inclusionDate!)
                                    .mmmDdYyyy()
                                : LocaleKeys.inclusion_date.tr(),
                            style: context.textStyles.bodyNormal
                                .copyWith(color: Colors.black),
                          ),
                          Assets.icons.icCalendar.svgBlack
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDivider() {
    return Column(
      children: const [
        SizedBox(height: 8),
        Divider(thickness: 1),
        SizedBox(height: 8),
      ],
    );
  }
}

class _AddMemberMRA extends StatelessWidget {
  const _AddMemberMRA();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberMRA>(
        selector: (state) => state.addMemberMRA,
        builder: (context, AddMemberMRA data) {
          final cubit = context.read<AddMemberCubit>();
          return CmoCollapseTitle(
            title: LocaleKeys.member_risk_assessment.tr(),
            showTick: data.isComplete,
            child: Container(
                padding: const EdgeInsets.all(12),
                color: context.colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        LocaleKeys.are_there_any_chemical_being_used_on_the_fme
                            .tr(),
                        style: context.textStyles.bodyNormal.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    CmoYesNoQuestion(
                        initialValue: data.firstAnswer,
                        onTap: (p0) => cubit.onDataChangeMRA(firstAnswer: p0)),
                    _buildDivider(),
                    Text(LocaleKeys.hcvs_present.tr(),
                        style: context.textStyles.bodyNormal.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    CmoYesNoQuestion(
                        initialValue: data.secondAnswer,
                        onTap: (p0) => cubit.onDataChangeMRA(secondAnswer: p0)),
                    _buildDivider(),
                    Text(LocaleKeys.rivers_on_fmu.tr(),
                        style: context.textStyles.bodyNormal.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    CmoYesNoQuestion(
                        initialValue: data.thirdAnswer,
                        onTap: (p0) => cubit.onDataChangeMRA(thirdAnswer: p0)),
                    _buildDivider(),
                    Text(
                        LocaleKeys
                            .are_there_any_communities_in_or_neighbouring_the_fme
                            .tr(),
                        style: context.textStyles.bodyNormal.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    CmoYesNoQuestion(
                        initialValue: data.fourthAnswer,
                        onTap: (p0) => cubit.onDataChangeMRA(fourthAnswer: p0)),
                    _buildDivider(),
                  ],
                )),
          );
        });
  }

  Widget _buildDivider() {
    return Column(
      children: const [
        SizedBox(height: 8),
        Divider(thickness: 1),
        SizedBox(height: 8),
      ],
    );
  }
}

class _AddMemberSDetails extends StatelessWidget {
  const _AddMemberSDetails();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberSDetails>(
      selector: (state) => state.addMemberSDetails,
      builder: (context, AddMemberSDetails data) {
        final cubit = context.read<AddMemberCubit>();
        return CmoCollapseTitle(
          title: LocaleKeys.site_details.tr(),
          showTick: data.isComplete,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            color: context.colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitle(context, 'Site Name (*)'),
                CmoTextField(
                  initialValue: data.siteName,
                  hintText: LocaleKeys.siteName.tr(),
                  onChanged: (p0) {
                    cubit.onDataChangeSiteDetail(siteName: p0);
                  },
                ),
                const SizedBox(height: 12),
                _buildTitle(context, 'Town (*)'),
                CmoTextField(
                  initialValue: data.town,
                  hintText: LocaleKeys.town.tr(),
                  onChanged: (p0) {
                    cubit.onDataChangeSiteDetail(town: p0);
                  },
                ),
                const SizedBox(height: 12),
                _buildTitle(context, 'Province (*)'),
                CmoTextField(
                  initialValue: data.province,
                  hintText: 'Province',
                  onChanged: (p0) {
                    cubit.onDataChangeSiteDetail(province: p0);
                  },
                ),
                const SizedBox(height: 16),
                _buildTitle(context, 'Site Location (*)'),
                CmoDropDownLayoutWidget(
                  onTap: () async {
                    final siteLocationScreenResult =
                        await SelectSiteLocationScreen.push<
                            SiteLocationScreenResult>(
                      context,
                      showMarker: true,
                      showResetAcceptIcons: true,
                      initAddress: data.addMemberSiteLocations.address ??
                          data.initAddressForSiteLocation(),
                          latLng: data.addMemberSiteLocations.lat != null &&
                              data.addMemberSiteLocations.lng != null
                          ? LatLng(data.addMemberSiteLocations.lat!,
                              data.addMemberSiteLocations.lng!)
                          : null,
                    );

                    if (siteLocationScreenResult is SiteLocationScreenResult) {
                      final latLong = siteLocationScreenResult.latLong;
                      if (latLong?.latitude == null ||
                          latLong?.longitude == null) {
                        return;
                      }

                      final address =
                          '${siteLocationScreenResult.address}\n${latLong?.latitude.toStringAsFixed(6)}, ${latLong?.longitude.toStringAsFixed(6)}';

                      await cubit.onDataChangeSiteDetail(
                        siteLocationLat:
                            siteLocationScreenResult.latLong?.latitude,
                        siteLocationLng:
                            siteLocationScreenResult.latLong?.longitude,
                        siteLocationAddress: address,
                      );
                    }
                  },
                  title: LocaleKeys.siteLocation.tr(),
                  showTick: data.isCompleteSiteLocation,
                ),
                const SizedBox(height: 12),
                _buildTitle(context, 'Compartment/s'),
                BlocSelector<AddMemberCubit, AddMemberState, double?>(
                  selector: (state) => state.addMemberSDetails.addMemberCompartmentsState.farmSize,
                  builder: (context, farmSize) {
                    final farmSizeTitle = farmSize == null ? null : '${farmSize.toStringAsFixed(2)}${LocaleKeys.ha_unit.tr()}';
                    return CmoDropDownLayoutWidget(
                      title: LocaleKeys.compartment_s.tr(),
                      showTick: data.isCompleteCompartments,
                      subTitle: farmSizeTitle,
                      subTitleAlignment: Alignment.center,
                      subTitleTextStyle: context.textStyles.titleBold.copyWith(fontSize: 16),
                      onTap: () async {
                        final state = context.read<AddMemberCubit>().state;
                        final farmName = state.farm?.farmName;
                        final farmId = state.farm?.farmId;
                        final result = await CompartmentScreen.push(context,
                            farmId: farmId, farmName: farmName);

                        if (result != null) {
                          await cubit.onDataChangeSiteDetail(
                              addingCompartmentResult: result,
                          );
                        }
                      },
                    );
                  },
                ),
                const SizedBox(height: 12),
                _buildTitle(context, 'ASI'),
                CmoDropDownLayoutWidget(
                  onTap: () async {
                    final state = context.read<AddMemberCubit>().state;
                    final farmName = state.farm?.farmName;
                    final farmId = state.farm?.farmId;
                    final result = await ASIScreen.push(context,
                        farmId: farmId, farmName: farmName);

                    await cubit.onDataChangeSiteDetail(asis: result);
                  },
                  title: LocaleKeys.asi.tr(),
                  showTick: data.isCompleteASI,
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _buildTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: context.textStyles.bodyBold,
      ),
    );
  }
}

class _AddMemberMDetails extends StatelessWidget {
  const _AddMemberMDetails();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberMDetails>(
      selector: (state) => state.addMemberMDetails,
      builder: (context, AddMemberMDetails data) {
        final cubit = context.read<AddMemberCubit>();
        return CmoCollapseTitle(
          title: LocaleKeys.memberDetails.tr(),
          showTick: data.isComplete,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AttributeItem(
                  isShowError: data.isFirstNameError,
                  errorText: LocaleKeys.firstName.tr(),
                  child: InputAttributeItem(
                    initialValue: data.firstName,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.firstName.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(firstName: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isLastNameError,
                  errorText: LocaleKeys.lastName.tr(),
                  child: InputAttributeItem(
                    initialValue: data.lastName,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.lastName.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(lastName: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isIdNumberError,
                  errorText: LocaleKeys.idPassportNumber.tr(),
                  child: InputAttributeItem(
                    initialValue: data.idNumber,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.idPassportNumber.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(idNumber: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  isShowError: data.isMobileNumberError,
                  errorText: LocaleKeys.mobileNumber.tr(),
                  child: InputAttributeItem(
                    initialValue: data.mobileNumber,
                    textStyle: context.textStyles.bodyNormal.blueDark2,
                    labelText: LocaleKeys.mobileNumber.tr(),
                    labelTextStyle: context.textStyles.bodyBold.blueDark2,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(mobileNumber: value);
                    },
                  ),
                ),
                const SizedBox(height: 12),
                AttributeItem(
                  child: InputAttributeItem(
                    initialValue: data.emailAddress,
                    textStyle: context.textStyles.bodyNormal.black,
                    labelText: '${LocaleKeys.emailAddress.tr()} (${LocaleKeys.optional.tr()})',
                    labelTextStyle: context.textStyles.bodyNormal.blueDark2,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      cubit.onDataChangeMemberDetail(emailAddress: value);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
