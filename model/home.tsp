model LifestyleWalletSummaryDTO {
    totalAmount?: int32 | null;
    paidAmount?: int32 | null;
    pendingAmount?: int32 | null;
    unpaidAmount?: int32 | null;

    // TODO: add this from lifestyle wallet history dto
    list?: {}[] | null;
}

model BirthMonthRemainingDTO {
    remainingDay?: int32 | null;
}
