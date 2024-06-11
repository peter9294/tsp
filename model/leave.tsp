enum LeaveType {
    ANNUAL: "Annual",
    BIRTH_MONTH: "BirthMonth",
    SPECIAL: "Special",
    CARRY_OVER: "CarryOver",
    SICK: "Sick",
    PERSONAL: "Personal",
    MATERNITY: "Maternity",
}

enum LeaveSubType {
    FOO: "Foo",
    BAR: "Bar",
}

enum GetLeaveListSortBy {
    LEAVE_TYPE: "LeaveType",
    START_DATE: "StartDate",
    END_DATE: "EndDate",
    LEAVE_INTERVAL: "LeaveInterval",
    REMARK: "Remark",
    REQUEST_STATUS: "RequestStatus",
}

enum LeaveDayType {
    HALF_DAY: "HalfDay",
    FULL_DAY: "FullDay",
}

model LeaveListDTO {
    leaveType?: LeaveType;
    leaveSubType?: LeaveSubType;
    startDate?: utcDateTime | null;
    endDate?: utcDateTime | null;
    leaveInterval?: int32 | null;
    leaveDay?: LeaveDayType;
    remark?: string | null;
    requestStatus?: RequestStatus;
    leaveLeft?: LeaveAvailabilityCardDTO[] | null;
    attachments?: FileDTO[] | null;
    ...BaseTablePermission;
}

model LeaveAvailabilityCardDTO {
    leaveType?: LeaveType;
    availableDay?: int32 | null;
}
