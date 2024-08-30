model TotalEmployeeDTO {
    department?: Department;
    amount?: int16 | null;
}

model TotalLifestyleWalletDTO {
    lifestyleWalletType?: LifestyleWalletType;
    amount?: int16 | null;
}

model TotalPaymentDTO {
    paymentType?: PaymentType;
    amount?: int16 | null;
}
