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

enum GetLeaveHistorySortBy {
    NAME: "Name",
    LEAVE_TYPE: "LeaveType",
    START_END_DATE: "StartEndDate",
    LEAVE_INTERVAL: "LeaveInterval",
    REMARK: "Remark",
    LEAVE_LEFT: "LeaveLeft",
    REQUEST_STATUS: "RequestStatus",
}

enum GetLeaveRequestSortBy {
    NAME: "Name",
    LEAVE_TYPE: "LeaveType",
    START_END_DATE: "StartEndDate",
    LEAVE_INTERVAL: "LeaveInterval",
    REMARK: "Remark",
    LEAVE_LEFT: "LeaveLeft",
    REQUEST_STATUS: "RequestStatus",
}

enum GetLeaveManagementListSortBy {
    NAME_TITLE: "NameTitle",
    FIRST_NAME: "FirstName",
    LAST_NAME: "LastName",
    DEPARTMENT: "Department",
    ROLE: "Role",

    @doc("วันที่เริ่มทำงาน")
    START_WORK_DATE: "StartWorkDate",

    @doc("ระยะเวลาการทำงาน")
    WORK_INTERVAL: "WorkInterval",

    @doc("จำนวนวันลาทั้งหมด")
    TOTAL_LEAVE_AVAILABLE: "TotalLeaveAvailable",

    @doc("จำนวนวันลาที่เหลือ")
    TOTAL_LEAVE_LEFT: "TotalLeaveLeft",

    @doc("จำนวนวันลาพักผ่อนประจำปีที่เหลือ")
    TOTAL_ANNUAL_LEAVE_LEFT: "TotalAnnualLeaveLeft",

    @doc("จำนวนวันลาพักผ่อนในเดือนเกิดที่เหลือ")
    TOTAL_BIRTH_MONTH_LEAVE_LEFT: "TotalBirthMonthLeaveLeft",

    @doc("จำนวนวันลาพิเศษที่เหลือ")
    TOTAL_SPECIAL_LEAVE_LEFT: "TotalSpecialLeaveLeft",

    @doc("จำนวนวันลาป่วยที่เหลือ")
    TOTAL_SICK_LEAVE_LEFT: "TotalSickLeaveLeft",

    @doc("จำนวนวันลากิจส่วนตัวที่เหลือ")
    TOTAL_PERSONAL_LEAVE_LEFT: "TotalPersonalLeaveLeft",

    @doc("จำนวนวันลาคลอดที่เหลือ")
    TOTAL_MATERNITY_LEAVE_LEFT: "TotalMaternityLeaveLeft",

    @doc("จำนวนวันลาไปช่วยภรรยาที่คลอดบุตรที่เหลือ")
    TOTAL_PATERNITY_LEAVE_LEFT: "TotalPaternityLeaveLeft",
}

model Leave {
    leaveType?: LeaveType;
    leaveSubType?: LeaveSubType;
    startDate?: utcDateTime | null;
    endDate?: utcDateTime | null;
    leaveInterval?: int32 | null;
    leaveDay?: LeaveDayType;
    remark?: string | null;
    requestStatus?: RequestStatus;
    leaveLeft?: LeaveLeftDTO[] | null;
    attachments?: FileDTO[] | null;
}

model LeaveListDTO {
    ...Base;
    ...Leave;
    ...BaseTablePermission;
}

model LeaveLeftDTO {
    leaveType?: LeaveType;
    leaveSubType?: LeaveSubType;
    availableDay?: int32 | null;
}

model LeaveHistoryDTO {
    ...Base;
    user?: UserInfoDTO;
    ...Leave;
}

model LeaveRequestDTO {
    ...LeaveHistoryDTO;
    ...BaseTablePermission;
    ...BaseApprovePermission;
}

model LeaveManagementDTO {
    ...Base;
    nameTitle?: UserDTO.nameTitleTH;
    firstName?: UserDTO.firstNameTH;
    lastName?: UserDTO.lastNameTH;
    email?: UserDTO.email;
    ...WorkDetailDTO;
    totalLeave?: int32 | null;
    leaveLeft?: LeaveLeftDTO[];
    ...BaseTablePermission;
    ...BaseApprovePermission;
}
