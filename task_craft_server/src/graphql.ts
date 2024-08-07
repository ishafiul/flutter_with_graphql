
/*
 * -------------------------------------------------------
 * THIS FILE WAS AUTOMATICALLY GENERATED (DO NOT MODIFY)
 * -------------------------------------------------------
 */

/* tslint:disable */
/* eslint-disable */

export class CreateTaskInput {
    title: string;
    description: string;
}

export class UpdateTaskInput {
    title?: Nullable<string>;
    description?: Nullable<string>;
    id: string;
}

export class CreateDeviceUuidInput {
    deviceType: string;
    osName?: Nullable<string>;
    osVersion?: Nullable<string>;
    deviceModel?: Nullable<string>;
    isPhysicalDevice?: Nullable<boolean>;
    appVersion?: Nullable<string>;
    location?: Nullable<LocationInput>;
    ipAddress?: Nullable<string>;
    fcmToken: string;
}

export class LocationInput {
    lat: string;
    long: string;
}

export class RequestOtpInput {
    email: string;
    deviceUuid: string;
}

export class VerifyOtpInput {
    email: string;
    deviceUuid: string;
    otp: number;
}

export class LoginWithGoogleInput {
    googleToken: string;
    deviceUuid: string;
}

export class RefreshTokenInput {
    deviceUuid: string;
}

export class UpdateUserInput {
    email?: Nullable<string>;
    firstName?: Nullable<string>;
    lastName?: Nullable<string>;
    id: string;
}

export class Task {
    _id: string;
    title: string;
}

export class User {
    _id: string;
    firstName?: Nullable<string>;
    lastName?: Nullable<string>;
    profilePicture?: Nullable<string>;
    email: string;
}

export class DeviceUuId {
    deviceUuId: string;
}

export class TokenEntity {
    accessToken: string;
}

export class LoginWithGoogleEntity {
    accessToken: string;
    userId: string;
}

export abstract class IQuery {
    abstract health(): string | Promise<string>;

    abstract task(): Nullable<Task[]> | Promise<Nullable<Task[]>>;

    abstract taskById(id: string): Nullable<Task> | Promise<Nullable<Task>>;

    abstract logout(): DeviceUuId | Promise<DeviceUuId>;

    abstract user(id: string): User | Promise<User>;

    abstract userMe(): User | Promise<User>;
}

export abstract class IMutation {
    abstract createTask(createTaskInput: CreateTaskInput): Task | Promise<Task>;

    abstract updateTask(updateTaskInput: UpdateTaskInput): Task | Promise<Task>;

    abstract removeTask(id: string): Task | Promise<Task>;

    abstract createDeviceUuid(createDeviceUuidInput: CreateDeviceUuidInput): DeviceUuId | Promise<DeviceUuId>;

    abstract reqOtp(requestOtpInput: RequestOtpInput): User | Promise<User>;

    abstract verifyOtp(verifyOtpInput: VerifyOtpInput): TokenEntity | Promise<TokenEntity>;

    abstract loginWithGoogle(loginWithGoogleInput: LoginWithGoogleInput): LoginWithGoogleEntity | Promise<LoginWithGoogleEntity>;

    abstract refreshToken(refreshTokenInput: RefreshTokenInput): TokenEntity | Promise<TokenEntity>;

    abstract updateUser(updateUserInput: UpdateUserInput): User | Promise<User>;

    abstract removeUser(id: number): User | Promise<User>;
}

type Nullable<T> = T | null;
