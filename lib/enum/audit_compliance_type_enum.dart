// status = 1 -> C;
// status = 2 -> NC;
// status = 3 -> N/a;
enum AuditComplianceEnum {
  unknown(0),
  n(1),
  nc(2),
  na(3),
  ;

  const AuditComplianceEnum(
    this.data,
  );

  final int data;

  String get valueName {
    switch (this) {
      case AuditComplianceEnum.unknown:
        return '';
      case AuditComplianceEnum.n:
        return 'N';
      case AuditComplianceEnum.nc:
        return 'NC';
      case AuditComplianceEnum.na:
        return 'N/a';
    }
  }
}
