import 'package:cmo/extensions/extensions.dart';
import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/model/data/province.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/state/add_member_cubit/add_member_state.dart';
import 'package:cmo/state/dashboard/dashboard_cubit.dart';
import 'package:cmo/ui/components/select_site_location_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_membership_contract_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_chip_item_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_collapse_title_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/cmo_drop_down_layout_widget.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/widget/slimf_and_mpo_section.dart';
import 'package:cmo/ui/screens/perform/resource_manager/asi/asi_screen.dart';
import 'package:cmo/ui/screens/perform/resource_manager/compartments/compartment_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:cmo/ui/widget/cmo_app_bar_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key, this.farm});

  final Farm? farm;

  static Future<bool?> push(BuildContext context, {Farm? farm}) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (_) => AddMemberScreen(farm: farm)));
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
    cubit.disposeAddMember();
    dashboardCubit.getResourceManagerMembers();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit = context.read<AddMemberCubit>()..initAddMember(farm: widget.farm);
      dashboardCubit = context.read<DashboardCubit>();
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
            return const Center(child: CircularProgressIndicator());
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
                _AddMemberMFO(),
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
              margin: const EdgeInsets.all(8),
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
                      padding:
                          const EdgeInsets.only(left: 16, top: 8, bottom: 8),
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
                                : 'Included Date',
                            style: context.textStyles.bodyNormal
                                .copyWith(color: Colors.black),
                          ),
                          const Icon(Icons.date_range)
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

class _AddMemberMFO extends StatelessWidget {
  const _AddMemberMFO();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocSelector<AddMemberCubit, AddMemberState, AddMemberMFO>(
      selector: (state) => state.addMemberMFO,
      builder: (context, AddMemberMFO data) {
        final cubit = context.read<AddMemberCubit>();
        return CmoCollapseTitle(
            showTick: data.isComplete,
            title: LocaleKeys.member_farm_objectives.tr(),
            child: Container(
                height: size.height * 0.8,
                width: double.maxFinite,
                padding: const EdgeInsets.all(12),
                color: context.colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('*Production Forestry',
                        style: context.textStyles.bodyBold.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    CmoMFOQuestion(
                      initialValue: data.firstAnswer,
                      onTap: (p0) {
                        cubit.onDataChangeMFO(firstAnswer: p0);
                      },
                    ),
                    _buildDivider(),
                    Text('*Community upliftment',
                        style: context.textStyles.bodyBold.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    CmoMFOQuestion(
                      initialValue: data.secondAnswer,
                      onTap: (p0) {
                        cubit.onDataChangeMFO(secondAnswer: p0);
                      },
                    ),
                    _buildDivider(),
                    Text('*Environmental protection',
                        style: context.textStyles.bodyBold.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    CmoMFOQuestion(
                      initialValue: data.thirdAnswer,
                      onTap: (p0) {
                        cubit.onDataChangeMFO(thirdAnswer: p0);
                      },
                    ),
                    _buildDivider(),
                    Text('*Honey production',
                        style: context.textStyles.bodyBold.copyWith(
                            color: context.colors.black, fontSize: 16)),
                    const SizedBox(height: 8),
                    CmoMFOQuestion(
                      initialValue: data.fourthAnswer,
                      onTap: (p0) {
                        cubit.onDataChangeMFO(fourthAnswer: p0);
                      },
                    ),
                    _buildDivider(),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CmoFilledButton(
                            title: LocaleKeys.finalise_later.tr(),
                            onTap: () {
                              Navigator.pop(context, true);
                            }),
                        CmoFilledButton(
                            title: LocaleKeys.next.tr(),
                            onTap: () {
                              AddMemberMembershipContractScreen.push(
                                context,
                                farm: context
                                    .read<AddMemberCubit>()
                                    .state
                                    .farm,
                              );
                            }),
                      ],
                    ),
                  ],
                )));
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
                BlocSelector<AddMemberCubit, AddMemberState, double?>(
                  selector: (state) => state
                      .addMemberSDetails.addMemberCompartmentsState.farmSize,
                  builder: (context, farmSize) {
                    if (farmSize == null || farmSize == 0) {
                      return const SizedBox.shrink();
                    }

                    return Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                          color: context.colors.white,
                          border: Border.all(width: 1, color: context.colors.grey),
                          borderRadius: BorderRadius.circular(12),
                      ),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.total_hectares.tr(),
                            style: context.textStyles.titleBold
                                .copyWith(fontSize: 16),
                          ),
                          Expanded(
                            child: Text(
                              '${farmSize.toStringAsFixed(2)}${LocaleKeys.ha_unit.tr()}',
                              style: context.textStyles.bodyNormal.copyWith(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                BlocSelector<AddMemberCubit, AddMemberState, double?>(
                  selector: (state) => state
                      .addMemberSDetails.addMemberCompartmentsState.farmSize,
                  builder: (context, farmSize) {
                    if (farmSize == null || farmSize == 0) {
                      return const SizedBox.shrink();
                    }

                    return Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                          color: context.colors.white,
                          border: Border.all(width: 1, color: context.colors.grey),
                          borderRadius: BorderRadius.circular(12),
                      ),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.total_hectares.tr(),
                            style: context.textStyles.titleBold
                                .copyWith(fontSize: 16),
                          ),
                          Expanded(
                            child: Text(
                              '${farmSize.toStringAsFixed(2)}${LocaleKeys.ha_unit.tr()}',
                              style: context.textStyles.bodyNormal.copyWith(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
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
                _buildTitle(context, '${LocaleKeys.firstName.tr()} (*)'),
                CmoTextField(
                  initialValue: data.firstName,
                  hintText: LocaleKeys.firstName.tr(),
                  onChanged: (p0) {
                    cubit.onDataChangeMemberDetail(firstName: p0);
                  },
                ),
                const SizedBox(height: 12),
                _buildTitle(context, '${LocaleKeys.lastName.tr()} (*)'),
                CmoTextField(
                  initialValue: data.lastName,
                  hintText: LocaleKeys.lastName.tr(),
                  onChanged: (p0) {
                    cubit.onDataChangeMemberDetail(lastName: p0);
                  },
                ),
                const SizedBox(height: 12),
                _buildTitle(context, '${LocaleKeys.idPassportNumber.tr()} (*)'),
                CmoTextField(
                  initialValue: data.idNumber,
                  keyboardType: TextInputType.emailAddress,
                  hintText: LocaleKeys.idPassportNumber.tr(),
                  onChanged: (p0) {
                    cubit.onDataChangeMemberDetail(idNumber: p0);
                  },
                ),
                const SizedBox(height: 12),
                _buildTitle(context, '${LocaleKeys.mobileNumber.tr()} (*)'),
                CmoTextField(
                  initialValue: data.mobileNumber,
                  keyboardType: TextInputType.phone,
                  hintText: LocaleKeys.mobileNumber.tr(),
                  onChanged: (p0) {
                    cubit.onDataChangeMemberDetail(mobileNumber: p0);
                  },
                ),
                const SizedBox(height: 12),
                _buildTitle(context, '${LocaleKeys.emailAddress.tr()} (${LocaleKeys.optional.tr()})'),
                CmoTextField(
                  initialValue: data.emailAddress,
                  keyboardType: TextInputType.emailAddress,
                  hintText: LocaleKeys.emailAddress.tr(),
                  onChanged: (p0) {
                    cubit.onDataChangeMemberDetail(emailAddress: p0);
                  },
                ),
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