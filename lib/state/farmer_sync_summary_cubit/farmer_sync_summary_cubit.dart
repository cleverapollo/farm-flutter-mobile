import 'package:cmo/ui/components/sync_summary_component/sync_item_widget.dart';

class FarmerSyncSummaryCubit {
  List<SyncPairItemModel> data = [];

  void initData() {
    data
      ..add(SyncPairItemModel('Workers', isTitle: true))
      ..add(SyncPairItemModel('Unsynced', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Workers', count: 0))
      ..add(SyncPairItemModel('Registers', isTitle: true))
      ..add(SyncPairItemModel('Unsynced Accident and Incident',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Accident and Incident', count: 0))
      ..add(SyncPairItemModel('Unsynced Accident and Incident Property Damaged',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Accident and Incident Property Damaged',
          count: 0))
      ..add(SyncPairItemModel('Unsynced ASI', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total ASI', count: 0))
      ..add(SyncPairItemModel('Unsynced ASI Photos', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total ASI Photos', count: 0))
      ..add(SyncPairItemModel('Unsynced Biological Control Agents',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Biological Control Agents', count: 0))
      ..add(SyncPairItemModel('Unsynced Chemicals', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Chemicals', count: 0))
      ..add(SyncPairItemModel('Unsynced Disciplinaries',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Disciplinaries', count: 0))
      ..add(SyncPairItemModel('Unsynced Stakeholder Complaints',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Stakeholder Complaint', count: 0))
      ..add(SyncPairItemModel('Unsynced Employee Grievances',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Employee Grievances', count: 0))
      ..add(SyncPairItemModel('Unsynced Fire', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Fire', count: 0))
      ..add(SyncPairItemModel('Unsynced Pets and Disease',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Pets and Disease', count: 0))
      ..add(SyncPairItemModel('Unsynced Pets and Disease Treatment Methods',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Pets and Disease Treatment Methods',
          count: 0))
      ..add(SyncPairItemModel('Unsynced RTE Species Registers',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total RTE Species Registers', count: 0))
      ..add(SyncPairItemModel('Unsynced RTE Species Registers Photos',
          count: 0, isActive: true))
      ..add(SyncPairItemModel('Total RTE Species Registers Photos', count: 0))
      ..add(SyncPairItemModel('Unsynced Training', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total ', count: 0))
      ..add(SyncPairItemModel('Annual Production', isTitle: true))
      ..add(SyncPairItemModel('Unsynced', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Annual Productions', count: 0))
      ..add(SyncPairItemModel('Annual Budget', count: 0))
      ..add(SyncPairItemModel('Unsynced', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Annual Budgets Productions', count: 0))
      ..add(SyncPairItemModel('Annual Budget Transactions',
          isTitle: true, isActive: true))
      ..add(SyncPairItemModel('Unsynced', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Annual Budgets Productions', count: 0))
      ..add(SyncPairItemModel('Camps', isTitle: true))
      ..add(SyncPairItemModel('Unsynced', count: 0, isActive: true))
      ..add(SyncPairItemModel('Total Camps', count: 0))
      ..add(SyncPairItemModel('Scheduler', isTitle: true))
      ..add(SyncPairItemModel('Unsynced', count: 0, isActive: true))
      ..add(SyncPairItemModel('Upcoming Events', count: 0))
      ..add(SyncPairItemModel('Master Data', isTitle: true))
      ..add(SyncPairItemModel('Biological Control Agent Types', count: 0))
      ..add(SyncPairItemModel('Annual Farm Budget Transaction Category',
          count: 0))
      ..add(SyncPairItemModel('ASI Types', count: 0))
      ..add(SyncPairItemModel('Chemical Application Methods', count: 0))
      ..add(SyncPairItemModel('Chemical Types', count: 0))
      ..add(SyncPairItemModel('Countries', count: 0))
      ..add(SyncPairItemModel('Fire Causes', count: 0))
      ..add(SyncPairItemModel('Gender', count: 0))
      ..add(SyncPairItemModel('Grievance Issue', count: 0))
      ..add(SyncPairItemModel('Group Scheme', count: 0))
      ..add(SyncPairItemModel('Disciplinaries Issues', count: 0))
      ..add(SyncPairItemModel('Job Description', count: 0))
      ..add(SyncPairItemModel('Monitoring Requirement', count: 0))
      ..add(SyncPairItemModel('Nature of Injury', count: 0))
      ..add(SyncPairItemModel('Pets and Disease Type', count: 0))
      ..add(
          SyncPairItemModel('Pets and Disease Type Treatment Method', count: 0))
      ..add(SyncPairItemModel('Property Damaged', count: 0))
      ..add(SyncPairItemModel('Reject Reasons', count: 0))
      ..add(SyncPairItemModel('Schedule Activity', count: 0))
      ..add(SyncPairItemModel('Species Range', count: 0))
      ..add(SyncPairItemModel('Species Types', count: 0))
      ..add(SyncPairItemModel('Training Type', count: 0))
      ..add(SyncPairItemModel('Treatment Method', count: 0))
      ..add(SyncPairItemModel('Stakeholder', isTitle: true))
      ..add(SyncPairItemModel('Unsynced', count: 0, isActive: true))
      ..add(SyncPairItemModel('Customary Use Rights', count: 0))
      ..add(SyncPairItemModel('Farm Stakeholders', count: 0))
      ..add(SyncPairItemModel('Group Scheme Stakeholders', count: 0))
      ..add(SyncPairItemModel('Social Upliftments', count: 0))
      ..add(SyncPairItemModel('Special Sites', count: 0))
      ..add(SyncPairItemModel('Stakeholder Types', count: 0));
  }
}
