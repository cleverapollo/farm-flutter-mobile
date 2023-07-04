import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_sign_contract_screen.dart';
import 'package:cmo/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../widget/cmo_app_bar_v2.dart';

class AddMemberMembershipContractScreen extends StatelessWidget {
  const AddMemberMembershipContractScreen({super.key, this.farm});
  final Farm? farm;

  static Future<void> push(BuildContext context, {Farm? farm}) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddMemberMembershipContractScreen(
          farm: farm,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CmoAppBarV2(
        title: LocaleKeys.addMember.tr(),
        subtitle: farm?.farmName ?? '',
        showTrailing: true,
      ),
      body: SizedBox.expand(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: size.width,
                color: context.colors.blueDark1,
                child: Text(LocaleKeys.membershipContract.tr(),
                    style: context.textStyles.titleBold
                        .copyWith(color: context.colors.white)),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Html(
                    data: html
                        .replaceAll("{{farm.FirstName}}", farm?.firstName ?? '')
                        .replaceAll("{{farm.LastName}}", farm?.lastName ?? ''),
                  ),
                ),
              ),
              Center(
                  child: CmoFilledButton(
                      title: LocaleKeys.accept.tr(),
                      onTap: () {
                        context
                            .read<AddMemberCubit>()
                            .onDataChangeMemberContract();
                        AddMemberSignContractScreen.push(context, farm: farm);
                      })),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

const String html = """
<div class="wizardWrapper">
    <div class="contractPreviewWrapper">

      <div class="contractSectionWrapper">

        <div class="contractSectionTitle">
          1. Membership Contract
        </div>
        <div class="contractSectionContent">
          <p><i>FSC group certification contract between group member and group manager. </i></p>

          <p>Contract parties:</p>

          <p> This contract is signed between <strong>CMO</strong> (group manager) and <strong>{{farm.FirstName}}
              {{farm.LastName}}</strong> (group member).</p>

          <p>Name and code of FSC group: CMO 01</p>

          <p>Specification of the forest area: As per application.</p>

          <p>Total area (ha): As per application</p>

          <p>Number of separate lots: 1</p>

        </div>
      </div>


      <div class="contractSectionWrapper">

        <div class="contractSectionTitle">
          2. Obligations of the group member
        </div>
        <div class="contractSectionContent">
         <p>While the contract is in force <strong>{{farm.FirstName}} {{farm.LastName}}</strong> is obligated to:</p>
     
            <ol>
              <li>Follow all forestry related national laws and all other legal acts. </li>
              <li>Follow the rules of the applicable FSC standard.</li>
              <li>Pay all legally prescribed fees and taxes in due time and in correct amount.</li>
              <li>Follow CMO certification scheme’s principles and requirements as informed by “Resource Management
                Unit”. </li>
              <li>Report any discovered illegal or unwanted activities immediately to the group/resource manager.</li>
              <li>Report any observed non-compliances in relation to FSC principles immediately to the group manager and
                seek solution for addressing the non-compliance.</li>
              <li>If HCV(s) have been identified in the FME, Group member/ forest owner shall <i>ask permission from
                  group/ resource manager prior to using any chemicals or fertilizers in the forest and report exact
                  type, origin and quantity of substance used to the group/ resource manager immediately after the work
                  has been finished</i>.</li>
              <li>If HCV(s) have been identified in the FME, Group member/ forest owner shall ask permission from the
                group/resource manager before commencing any large scale activities in the forest (like road building or
                works with drainage systems) and report finished works to the group manager.</li>
              <li>Keep his/her (group member’s) forest open to the public following the principles of everybody’s
                (common) rights and respect local customary and indigenous people’s rights.</li>
              <li><i>Use only labour and machinery that have been communicated and agreed upon by the resource
                  manager.</i></li>
              <li>Report all disputes with neighbours and local people to the group/resource  manager.</li>
              <li><i>Report all regeneration material used to group/resource manager</i></li>
              <li>Constantly maintain records of actually felled timber volumes by species and assortments together with
                documentation that proves the legality of the felling (felling permits etc.) and send the data to the
                group manager at least once a year or upon request.</li>
              <li>Constantly maintain records about sold volumes by buyers and months. In addition, maintain all sales
                documentation (invoices, waybills etc.). Also the group member agrees to submit the data to the group/
                resource manager at least once a year or upon request. </li>
            </ol>
       
        </div>
      </div>

      <div class="contractSectionWrapper">

        <div class="contractSectionTitle">
          3. Obligations of the group manager 
        </div>
         <p>While the contract is in force, CMO is obligated to:</p>
          <ol>
            <li>Provide advice and help to <strong>{{farm.FirstName}} {{farm.LastName}}</strong> upon request related to forest management according to FSC principles.</li>
            <li>Check the compliance of the activity of all members to FSC P&C using the toolkit documents, discussions and field audits and issue CARs if necessary.</li>
            <li>Collect all FSC relevant information from the group members, keep up-to-date records and report activities annually to CB.</li>
          </ol>
   
        <p>
            CMO has the right to terminate the contract in case non- compliances with the certification scheme or national laws by the <strong>{{farm.FirstName}} {{farm.LastName}}</strong> are proved and not corrected. 
        </p>
        <p>
            CMO has to report discovered non-conformances to <strong>{{farm.FirstName}} {{farm.LastName}}</strong> and give sufficient time to take corrective actions before terminating the contract. 
        </p>
        <p>
            After prior notice CMO has also the right to terminate the contract in case <strong>{{farm.FirstName}} {{farm.LastName}}</strong> has not paid all fees in due time. 
        </p>
        <p>
            In case of any disputes between the parties, the first step is to voluntarily seek an agreement between group manager and group member. If no solution is found, the conflict should be resolved according to nationally applicable laws and regulations. 
        </p>
        <p>
          All rights and obligations of the parties not described here will be treated according to nationally applicable law. The contract is compiled in two juridical equivalent copies. 
        </p>

        <p>
          Group manager: CMO
          <br/>
          Name: Michal Brink (CEO) 
        </p>

      </div>
    </div>

  </div>
""";
