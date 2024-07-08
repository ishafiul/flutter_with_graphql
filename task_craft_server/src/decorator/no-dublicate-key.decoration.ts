import {
  registerDecorator,
  ValidationOptions,
  ValidatorConstraint,
  ValidatorConstraintInterface,
} from 'class-validator';

@ValidatorConstraint({ async: false })
class NoDuplicateKeysConstraint implements ValidatorConstraintInterface {
  validate(value: any) {
    if (!value || typeof value !== 'object') {
      return false;
    }

    const properties = Object.values(value);

    // Check for duplicate keys within each property
    for (const property of properties) {
      const keys = Object.keys(property);
      const uniqueKeys = new Set(keys);
      if (keys.length !== uniqueKeys.size) {
        return false;
      }
    }

    return true;
  }

  defaultMessage() {
    return 'Duplicate keys are not allowed within nested objects';
  }
}

export function NoDuplicateKeys<T>(validationOptions?: ValidationOptions) {
  return function (object: T, propertyName: string) {
    registerDecorator({
      target: object.constructor,
      propertyName: propertyName,
      options: validationOptions,
      constraints: [],
      validator: NoDuplicateKeysConstraint,
    });
  };
}
