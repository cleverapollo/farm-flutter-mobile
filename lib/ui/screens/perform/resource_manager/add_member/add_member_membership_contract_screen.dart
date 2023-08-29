import 'package:cmo/l10n/l10n.dart';
import 'package:cmo/model/data/farm.dart';
import 'package:cmo/state/add_member_cubit/add_member_cubit.dart';
import 'package:cmo/ui/screens/perform/resource_manager/add_member/add_member_done_screen.dart';
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
                        .replaceAll("{{farm.LastName}}", farm?.lastName ?? '')
                        .replaceAll("{{hectares}}", (farm?.farmSize ?? 0).toStringAsFixed(2))
                        .replaceAll("{{farm.SiteName}}", farm?.farmName ?? ''),
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
                       AddMemberDone.push(context, farm: farm);
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
          <strong>1. Contract parties: </strong>
        </div>
        <div class="contractSectionContent">
          <p> This contract is signed between CMO (group scheme owner) and <strong>{{farm.FirstName}}
              {{farm.LastName}}</strong> (group member). of the farm(s) <strong>{{farm.SiteName}}</strong> in the extent of <strong>{{hectares}}</strong> hectares.</p>
        </div>
      </div>


      <div class="contractSectionWrapper">
        <div class="contractSectionTitle">
          <strong>2. Obligations of the group member </strong>
        </div>
        <div class="contractSectionContent">
         <p>While the contract is in force <strong>{{farm.FirstName}} {{farm.LastName}}</strong> is obligated to:</p>
     
            <ol>
              <li>Group members shall join the scheme for a minimum period of 5 (five) years; </li>
              <li>Member confirms that the member is not included in another FSC and/or PEFC certificate;</li>
              <li>The member agrees that the Group Entity will be the main contact for certification;</li>
              <li>Member will not be allowed to sell products as FSC and/or PEFC certified until a written <strong>confirmation</strong> has been received from CMO;</li>
              <li>Follow all forestry related national laws and all other legal acts;</li>
              <li>Follow the rules of the National FSC and/or PEFC standards as contained in the CMO internal audit checklist;</li>
              <li>Follow the rules of the FSC/PEFC Group Scheme Standards;</li>
              <li>An annual audit visit shall be made to each member. All members are required to undergo the audit and to address any non-compliances, which are identified within the agreed time frame. If required sampling of members may be implemented;</li>
              <li>Members shall allow the Group Manager, resource manager, internal auditors, Certification Body, FSC, PEFC Accreditation body and stakeholders access to their property in order to monitor compliance to the group standards. Stakeholders may only be denied access if the member can prove that the visit by a specific stakeholder could lead to a conflict of interest;</li>
              <li>Members must maintain all information for monitoring purposes for a period of at least 5 years;</li>
              <li>Members must maintain and make available non-commercial information related to the management of the certified area for public information;</li>
              <li>The Group Manager and certification body has the right to publish any non-commercial information about the scheme for public scrutiny;</li>
              <li>Constantly maintain records of harvested volumes together with documentation that proves the legality of the felling (felling permits etc.) and send the data to the group manager at least once a year or upon request or upload detail on CMO software monthly;</li>
              <li>Constantly maintain records about sold volumes/tons by buyers and months. In addition, maintain all sales documentation (invoices, waybills etc.). Also, the group member agrees to submit the data to the group/resource manager monthly by e-mail or on the software. And when requested, the totals sold per year;and </li>
              <li>The member is certified under the FSC standards or both FSC and PEFC standards.</li>
            </ol>
        </div>
      </div>
      
      <div class="contractSectionWrapper">
        <div class="contractSectionTitle">
          <strong>3. Leaving the group </strong>
        </div>
        <p>Members may only leave the group for the following reasons:</p>
             <ol>
                <li>The farmer wishes to join another group scheme or is seeking individual certification; </li>
                <li>The farm has been sold. The certified property automatically loses its certification when it is sold;</li>
                <li>The Farm area has been completely destroyed by a natural disaster; or</li>
                <li>If the farmer is engaged in a serious dispute with the Group scheme manager.</li>
             </ol>
       <p>Should members leave the scheme for reasons another than the ones listed above, then such a member shall be prohibited from re-joining the CMO group scheme for a period of at least 3 years.</p>
       <p>Members wishing to leave the group must give the group manager 3 months’ notice in writing, clearly stating the reason for leaving.</p>
       <p>Members leaving the group scheme must pay outstanding fees in full. CMO shall NOT refund any fees when a member leaves the scheme.</p>
       <p>Once the membership has been cancelled no products may be sold as FSC/PEFC certified.</p>
        </div>
      </div>
      
      <div class="contractSectionWrapper">
        <div class="contractSectionTitle">
          <strong>4. Expulsion from the group</strong>
        </div>
        <p>The following might lead to expulsion from the group:</p>
             <ol>
                <li>Members who do not allow access to their forests to group staff, internal auditors, Certification Body representatives and FSC/PEFC representatives for the purposes of ongoing monitoring and surveillance; </li>
                <li>Failing to address non-compliance within the agreed time;</li>
                <li>Failure to meet the requirements of the Group scheme;</li>
                <li>Failing to pay membership fees; or</li>
                <li>Members making false claims or misusing the CMO Group Scheme or FSC/PEFC’s name or logo.</li>
             </ol>
        <p>As soon as a person is expelled, the person:</p>
            <ol>
                <li>May no longer market certified products as FSC/PEFC products or use the FSC/PEFC logo on any timber products; </li>
                <li>Must immediately return all unused FSC/PEFC labels to the Group Scheme Manager or client that provided the labelled packing material;</li>
                <li>Members who have been expelled from the scheme shall NOT receive any incentive on timber delivered after the expulsion date. Should the person appeal, and the appeal is upheld, the person will be reinstated into the group and will receive the full benefits as usual;</li>
                <li>Members who have been expelled shall be invoiced for all outstanding membership fees; and</li>
                <li>Members will not be allowed to join the group for 3 years.</li>
            </ol>
        </div>
      </div>
      
      <div class="contractSectionWrapper">

        <div class="contractSectionTitle">
          <strong>5. Re-entry to the group</strong>
        </div>
        <div class="contractSectionContent">
          <p> Former members who left the group because the member wanted to join another scheme can apply to re-join the CMO GS after a period of three years. The person shall only be allowed back into the scheme after a pre-entry inspection. The following fees are applicable:</p>
          <ol>
                <li>Any outstanding fees if applicable; </li>
                <li>Pre-payment of initial pre-entry fee; and</li>
                <li>Members who were expelled from the scheme as a result of non-compliances to the group standards or who did not close the CAR in time would only be allowed back into the scheme once a full pre-entry inspection has been done and all findings have been addressed.</li>
           </ol>
        </div>
      </div>
      
      <div class="contractSectionWrapper">

        <div class="contractSectionTitle">
          <strong>6. Commitment to FSC</strong>
        </div>
        <div class="contractSectionContent">
          <p>CMO’s scope of certification is FSC Forest Management and Certification. The <strong>group member</strong> is committed to ensuring the FME’s within the scope of certification do not contravene the FSC Controlled Wood Categories:</p>
          <ol>
                <li>Illegally harvested wood; </li>
                <li>Wood harvested in violation of traditional and civil rights;</li>
                <li>Wood which has been harvested from non-FSC-certified forest management units in which high conservation values are threatened by management activities;</li>
                <li>Wood harvested from areas being converted from forests and other wooded ecosystems to plantation or non-forest uses; </li>
                <li>Wood from forest management unit in which genetically modified trees are planted; and</li>
                <li>Violation of any of the ILO Core Conventions as defined in the ILO Declaration on Fundamental Principles and Rights at Work.</li>
           </ol>
          <p>The member is committed to the FSC P&Cs and is progressing towards the achievement of FSC Forest Management certification over a medium-long term period as reflected in the local approved FSC National Forest Stewardship Standard.</p>
        </div>
      </div>
      
      <div class="contractSectionWrapper">
        <div class="contractSectionTitle">
          <strong>7. Commitment to PEFC</strong>
        </div>
        <div class="contractSectionContent">
          <p>The CMO Group and the member are committed to implement and maintain the PEFC Forest Management standard requirements in accordance with the applicable approved standard. This commitment as part of this contact is available to the member’s personnel, suppliers, customers, and other interested parties on request.</p>
          <p>The group member recognises the value of forests as renewable natural resources, livelihood for people, valuable landscape component, possibility for recreation, habitat for many animals and species and constituting a unique ecosystem, we wish to preserve all important forest structures and functions.</p>
        </div>
      </div>
      
      <div class="contractSectionWrapper">

        <div class="contractSectionTitle">
          <strong>8. Obligations of the Group Manager </strong>
        </div>
        <div class="contractSectionContent">
          <p>While the contract is in force, CMO is obligated to:</p>
          <ol>
                <li>Provide advice to the Group Member:</li>
                    <ol>
                      <li>Upon request related to forest management according to FSC principles and the PEFC standard requirements. Where such advice exceeds a few hours of support, CMO is entitled to invoice the member at its prevailing rates.</li>
                      <li>Check the compliance of the activity of all members to FSC P&C and PEFC requirements using the toolkit documents, discussions and field audits and issue CARs if necessary. </li>
                      <li>Collect all FSC/PEFC relevant information from the group members, keep up-to-date records and report activities annually to CB. </li>
                    </ol>
                <li>Control, issue and revision of group documentation and procedures;</li>
                <li>Control and issue of technical information to group members;</li>
                <li>Establishment of inspection and monitoring procedures;</li>
                <li>Preparation of monitoring schedules (To be done by audit contractors);</li>
                <li>Maintenance of the Register of Members;</li>
                <li>Maintenance of CAR register and ensuring implementation of corrective action and ensuring those details of preventative action are communicated to all group members;</li>
                <li>Coordination of internal communication between members and preparation and revision of information for applicants and group members;</li>
                <li>Coordination of external communication between the group and regulatory authorities, government departments and stakeholder groups;</li>
                <li>CMO Group has the right to terminate the contract in case non-compliances with the certification scheme or national laws by the Group Member are proved and not corrected;</li>
                <li>CMO Group has to report discovered non-conformances to Group Members and give sufficient time to take corrective actions before terminating the contract; and</li>
                <li>After prior notice CMO has also the right to terminate the contract in case Group Member has not paid all fees in due time.</li>
           </ol>
          <p>In case of any disputes between the parties, the first step is to voluntarily seek an agreement between group manager and group member. If no solution is found, the conflict should be resolved according to nationally applicable laws and regulations. </p>
          <p>All rights and obligations of the parties not described here will be treated according to nationally applicable law. The contract is compiled in two juridical equivalent copies.</p>
        </div>
      </div>
    </div>
  </div>
""";
