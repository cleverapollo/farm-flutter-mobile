import 'package:form_builder_validators/form_builder_validators.dart';

final emailValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
  FormBuilderValidators.email(),
]);

final requiredValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
]);

final latitudeValidator = FormBuilderValidators.compose([
  (String? value) {
    if (value == null) return null;
    final dValue = double.tryParse(value.replaceAll(',', '.'));
    if (dValue == null || dValue < -90 || dValue > 90) {
      return 'Latitude must be numeric value between -90 and 90';
    }
    return null;
  }
]);

final longitudeValidator = FormBuilderValidators.compose([
  (String? value) {
    if (value == null) return null;
    final dValue = double.tryParse(value.replaceAll(',', '.'));
    if (dValue == null || dValue < -180 || dValue > 180) {
      return 'Longitude must be numeric value between -180 and 180';
    }
    return null;
  }
]);
