enum GetPaymentListSortBy {
    PAYMENT_TYPE: "PaymentType",
    PROJECT_NAME: "ProjectName",
    LOCATION: "Location",
    SPEND_DATE: "SpendDate",
    AMOUNT: "Amount",
    STATUS: "status",
}

enum GetPaymentHistorySortBy {
    NAME: "Name",
    PAYMENT_TYPE: "PaymentType",
    PROJECT_NAME: "ProjectName",
    LOCATION: "Location",
    SPEND_DATE: "SpendDate",
    AMOUNT: "Amount",
    STATUS: "status",
}

enum GetPaymentRequestSortBy {
    NAME: "Name",
    PAYMENT_TYPE: "PaymentType",
    PROJECT_NAME: "ProjectName",
    LOCATION: "Location",
    SPEND_DATE: "SpendDate",
    AMOUNT: "Amount",
    STATUS: "status",
}

enum PaymentType {
    ALLOWANCE: "Allowance",
    TRANSPORTATION: "Transportation",
    ADVANCE_PAYMENT: "AdvancePayment",
    SKILL_UP: "SkillUp",
}

enum DateType {
    WEEKDAY: "Weekday",
    WEEKEND: "Weekend",
}

enum PaymentStatus {
    PENDING: "Pending",
    APPROVE: "Approve",
    PAID: "Paid",
    REJECT: "Reject",
}

enum VehicleType {
    PRIVATE: "Private",
    TAXI: "Taxi",
}

model Payment {
    paymentType?: PaymentType;
    paymentStatus?: PaymentStatus;
    dateType?: DateType;
    spendDate?: utcDateTime | null;
    project?: ProjectNameDTO;
    location?: string | null;
    province?: string | null;
    attachment?: FileDTO[] | null;
    amount?: int32 | null;
    hasTaxInvoice?: boolean | null;
    remark?: string | null;
}

model AdvancePayment {}

model AllowancePayment {}

model TransportationPayment {
    destination?: string | null;
    destinationProvince?: string | null;
    distance?: int32 | null;
    vehicleType?: VehicleType;
    taxiFee?: int32 | null;
    highwayFee?: int32 | null;
    parkingFee?: int32 | null;
}

model SkillUpPayment {
    course?: SkillUpCourseDTO;
    url?: string | null;
}

model PaymentListDTO {
    ...Base;
    ...Payment;
    ...AdvancePayment;
    ...AllowancePayment;
    ...TransportationPayment;
    ...SkillUpPayment;
    ...BaseTablePermission;
}

model PaymentRequestHistoryDTO {
    ...PaymentListDTO;
    user?: UserRequestDTO;
    totalAmount?: int32 | null;
    reason?: string | null;
    ...BaseApprovePermission;
}
