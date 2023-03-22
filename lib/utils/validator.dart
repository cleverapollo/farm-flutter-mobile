import 'package:form_builder_validators/form_builder_validators.dart';

final emailValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
  FormBuilderValidators.email(),
]);

final requiredValidator = FormBuilderValidators.compose([
  FormBuilderValidators.required(),
]);
