enum LeaveType {
    @doc("ลาพักร้อน")
    ANNUAL: "Annual",

    @doc("ลาป่วย")
    SICK: "Sick",

    @doc("ลากิจ")
    PERSONAL: "Personal",

    @doc("ลาคลอด")
    MATERNITY: "Maternity",

    @doc("ลาช่วยภรรยาคลอดบุตร")
    PATERNITY: "Paternity",
}

enum AnnualLeaveSubType {
    @doc("ทั่วไป")
    NORMAL: "Normal",

    @doc("ลาเดือนเกิด")
    BIRTH_MONTH: "BirthMonth",

    @doc("ลาพิเศษ")
    SPECIAL: "Special",

    @doc("Carry over")
    CARRY_OVER: "CarryOver",
}

enum MaternityLeaveSubType {
    @doc("ลาตรวจครรถ์")
    PREGNANCY_TEST: "PregnancyTest",

    @doc("ลาคลอด")
    ANTENATAL_CARE: "AntenatalCare",
}

enum LeaveSubType {
    ...AnnualLeaveSubType,
    ...MaternityLeaveSubType,
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
    leaveSubType?: LeaveSubType;
    availableDay?: int32 | null;
}
