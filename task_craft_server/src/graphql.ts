
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

export class Task {
    _id: string;
    title: string;
    description: string;
}

export abstract class IQuery {
    abstract health(): string | Promise<string>;

    abstract task(): Nullable<Task[]> | Promise<Nullable<Task[]>>;

    abstract taskById(id: string): Nullable<Task> | Promise<Nullable<Task>>;
}

export abstract class IMutation {
    abstract createTask(createTaskInput: CreateTaskInput): Task | Promise<Task>;

    abstract updateTask(updateTaskInput: UpdateTaskInput): Task | Promise<Task>;

    abstract removeTask(id: string): Task | Promise<Task>;
}

type Nullable<T> = T | null;
