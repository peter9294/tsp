// Overall
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

model PaymentSummaryDTO {
    weekly?: int16 | null;
    monthly?: int16 | null;
    yearly?: int16 | null;
}

model ReportPaymentDTO {
    total?: TotalPaymentDTO[] | null;
    summary?: PaymentSummaryDTO;
}

model SkillUpSummaryXAxisDTO {
    @doc("ค่าแกน X: ['Q1', 'Q2',...]")
    data?: string[] | null;
}

model SkillUpSummarySeriesDTO {
    @doc("ชื่อหน่วยแกน Y: 'Completed', 'Learning'")
    name?: string | null;

    @doc("bar")
    type?: string | null;

    @doc("ค่าแกน Y")
    data?: int32[] | null;

    @doc("Learning = #F41919, Completed = #53D058")
    @format("hex")
    color?: string | null;
}

model SkillUpSummaryChartDTO {
    xAxis?: SkillUpSummaryXAxisDTO;
    series?: SkillUpSummarySeriesDTO[];
}

model FitChartXAxis {
    @doc("ค่าแกน X: ['ชื่อคน',]")
    data?: int32[] | null;
}

model FitChartSeriesDTO {
    @doc("amount")
    name?: string | null;

    @doc("bar")
    type?: string | null;

    data?: int32[] | null;

    @doc("Point = #FF3984, Wallet = #4F14DD")
    @format("hex")
    color?: string | null;
}

model FitChartDTO {
    xAxis?: FitChartXAxis;
    series?: FitChartSeriesDTO[];
}

// Employee

enum GetReportEmployeeListSortBy {
    NAME_TITLE_TH: "NameTitleTH",
    FIRST_NAME_TH: "FirstNameTH",
    LAST_NAME_TH: "LastNameTH",
    NAME_TITLE_EN: "NameTitleEN",
    FIRST_NAME_EN: "FirstNameEN",
    LAST_NAME_EN: "LastNameEN",
    DEPARTMENT: "Department",
    POSITION: "Position",
    JOIN_DATE: "JoinDate",
    LEAVE_LEFT: "LeaveLeft",
    TOTAL_FIT_WALLET: "TotalFitWallet",
    TOTAL_FIT_POINT: "TOtalFitPoint",
    TOTAL_LIFESTYLE_POINT: "TotalLifestylePoint",
    TOTAL_SKILLUP: "TotalSkillup",
    TOTAL_LIFESTYLE_LEFT: "TotalLifestyleLeft",
    TOTAL_LIFESTYLE_WALLET: "TotalLifestyleWallet",
    LIFESTYLE_LEFT: "LifestyleLeft",
}

model ReportEmployeeListDTO {
    ...Base;
    nameTitleTH?: UserDTO.nameTitleTH;
    firstNameTH?: UserDTO.firstNameTH;
    lastNameTH?: UserDTO.lastNameTH;
    nameTitleEN?: UserDTO.nameTitleEN;
    firstNameEN?: UserDTO.firstNameEN;
    lastNameEN?: UserDTO.lastNameEN;
    department?: UserDTO.department;
    position?: UserDTO.position;
    joinDate?: utcDateTime | null;
    leaveLeft?: int32 | null;
    totalFitWallet?: int32 | null;
    totalFitPoint?: int32 | null;
    totalLifeStylePoint?: int32 | null;
    totalSkillUp?: int32 | null;
    totalLifeStyleLeft?: int32 | null;
    totalLifeStyleWallet?: int32 | null;
    lifeStyleLeft?: int32 | null;
    canView?: boolean | null;
}

model ReportRecentActivitiesDTO {}

model ReportSkillupStatusChartDTO {
    completed: int32 | null;
    learning: int32 | null;
}

model ReportWelfareOverallChartDTO {
    welfareTotal?: int32 | null;
    skillUpTotal?: int32 | null;
    softeverFitTotal?: int32 | null;
}

model ReportLifestyleWalletOverallChartDTO {
    spendAmount?: int32 | null;
    availableAmount?: int32 | null;
}
