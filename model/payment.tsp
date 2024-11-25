enum GetPaymentListSortBy {
    PAYMENT_TYPE: "PaymentType",
    ITEM_NAME: "ItemName",
    PAYMENT_LOCATION: "PaymentLocation",
    SPEND_DATE: "SpendDate",
    TOTAL_AMOUNT: "TotalAmount",
    PAYMENT_STATUS: "PaymentStatus",
}

enum GetPaymentHistorySortBy {
    NAME: "Name",
    PAYMENT_TYPE: "PaymentType",
    ITEM_NAME: "ItemName",
    PAYMENT_LOCATION: "PaymentLocation",
    SPEND_DATE: "SpendDate",
    TOTAL_AMOUNT: "TotalAmount",
    PAYMENT_STATUS: "PaymentStatus",
}

enum GetPaymentRequestSortBy {
    NAME: "Name",
    PAYMENT_TYPE: "PaymentType",
    ITEM_NAME: "ItemName",
    PAYMENT_LOCATION: "PaymentLocation",
    SPEND_DATE: "SpendDate",
    TOTAL_AMOUNT: "TotalAmount",
    PAYMENT_STATUS: "PaymentStatus",
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
    dateType?: DateType | null;
    spendDate?: utcDateTime;
    itemName?: string | null;
    paymentLocation?: string;
    province?: string | null;
    attachment?: FileDTO[] | null;
    totalAmount?: float32;
    hasTaxInvoice?: boolean | null;
    remark?: string | null;
}

model AdvancePayment {}

model AllowancePayment {}

model TransportationPayment {
    destination?: string | null;
    destinationProvince?: string | null;
    distance?: int32 | null;
    vehicleType?: VehicleType | null;
    taxiFee?: float32 | null;
    highwayFee?: float32 | null;
    parkingFee?: float32 | null;
}

model SkillUpPayment {
    course?: SkillUpCourseDTO | null;
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
    reason?: string | null;
    ...BaseApprovePermission;
}
