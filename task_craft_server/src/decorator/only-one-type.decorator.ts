import {
  registerDecorator,
  ValidationOptions,
  ValidatorConstraint,
  ValidatorConstraintInterface,
} from 'class-validator';

@ValidatorConstraint({ async: false })
class OnlyOneTypeConstraint implements ValidatorConstraintInterface {
  validate(type: any) {
    if (!type || typeof type !== 'object') {
      return false;
    }

    const keys = Object.keys(type);
    const nonNullKeys = keys.filter(
      (key) => type[key] !== undefined && type[key] !== null,
    );

    // Ensure there's exactly one key in the object
    return nonNullKeys.length === 1;
  }

  defaultMessage() {
    return 'Exactly one type must be provided and cannot be null';
  }
}

export function OnlyOneType<T>(validationOptions?: ValidationOptions) {
  return function (object: T, propertyName: string) {
    registerDecorator({
      target: object.constructor,
      propertyName: propertyName,
      options: validationOptions,
      constraints: [],
      validator: OnlyOneTypeConstraint,
    });
  };
}
