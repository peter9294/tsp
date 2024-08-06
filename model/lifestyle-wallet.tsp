enum GetLifestyleWalletListSortBy {
    NAME: "Name",
    LIFESTYLE_WALLET_TYPE: "LifestyleWalletType",
    REWARD: "Reward",
    SPEND_DATE: "SpendDate",
    REQUEST_STATUS: "RequestStatus",
}

enum GetLifestyleWalletRequestSortBy {
    POSITION: "Position",
    ...GetLifestyleWalletListSortBy,
}
enum LifestyleWalletType {
    @doc("ทัวร์ท่องเที่ยว/ที่พัก/ค่าเดินทาง")
    TRAVEL: "Travel",

    @doc("การเรียนรู้")
    EDUCATION: "Education",

    @doc("อุปกรณ์คอมพิวเตอร์/อิเล็กทรอนิกส์/เกมคอนโซล")
    ELECTRONIC: "Electronic",

    @doc("อุปกรณ์กีฬาและฟิตเนส")
    SPORT: "Sport",

    @doc("เสื้อผ้าและเครื่องแต่งกาย")
    CLOTHES: "Clothes",

    @doc("ค่ารักษาพยาบาล")
    MEDICAL: "Medical",

    @doc("เฟอร์นิเจอร์และของตกแต่งบ้าน")
    FURNITURE: "Furniture",
}

model LifestyleWalletSummaryDTO {
    @doc("จำนวนเงินสะสม")
    totalAmount?: int32 | null;

    @doc("ใช้จ่ายไปแล้ว")
    paidAmount?: int32 | null;

    @doc("จำนวนเงินคงเหลือ")
    pendingAmount?: int32 | null;

    @doc("จำนวนเงินที่ยังไม่อนุมัติ")
    unpaidAmount?: int32 | null;

    @doc("จำนวนเงินจาก fitwallet")
    fitWalletAmount?: int32 | null;

    @doc("จำนวนเงินจาก skill up")
    skillUpAmount?: int32 | null;
}

model LifestyleWallet {
    remark?: string | null;
    itemName?: string | null;
    lifestyleWalletType?: LifestyleWalletType;
    spendDate?: utcDateTime | null;
    attachment?: FileDTO;
    reward?: int32 | null;
    hasTaxInvoice?: boolean | null;
    requestStatus?: RequestStatus;
}

model LifestyleWalletListDTO {
    ...Base;
    ...LifestyleWallet;
    ...BaseTablePermission;
}

model LifestyleWalletRequestDTO {
    ...Base;
    user?: UserRequestDTO;
    summary?: LifestyleWalletSummaryDTO;
    ...LifestyleWallet;
    ...BaseTablePermission;
    ...BaseApprovePermission;
}

model LifestyleWalletRequestHistoryDTO {
    ...LifestyleWalletRequestDTO;
    reason?: ApproveDTO.reason | null;
}
