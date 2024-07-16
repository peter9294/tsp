enum Performance {
    FULL: "Full",
    HALF: "Half",
}

enum GetSofteverFitListSortBy {
    ACTIVITY: "Activity",
    DISTANCE: "Distance",
    STEP: "Step",
    CALORIES: "Calories",
    PERFORMANCE: "Performance",
    DATE: "Date",
    REWARD: "Reward",
    REQUEST_STATUS: "RequestStatus",
}

enum ActivityType {
    RUNNING: "Running",
    WALKING: "Walking",
}

enum GetSofteverFitRequestSortBy {
    NAME: "Name",
    POSITION: "Position",
    ...GetSofteverFitListSortBy,
}

model SofteverFitSummaryDTO {
    totalActivity?: int32 | null;
    totalWallet?: int32 | null;
    totalPoint?: int32 | null;
}

model SofteverFitWalletXAxisDTO {
    @doc("ค่าแกน X: ['Mon', 'Tue',...] // ['Jan', 'Feb',...] // ['2024', '2025',...]")
    data?: string[] | null;
}

model SofteverFitWalletSeriesDTO {
    @doc("ชื่อหน่วยแกน Y")
    name?: string | null;

    @doc("ค่าแกน Y")
    data?: int32[] | null;

    @format("hex")
    color?: string | null;
}

model SofteverFitWalletChartDTO {
    xAxis?: SofteverFitWalletXAxisDTO | null;
    series?: SofteverFitWalletSeriesDTO | null;
}

model SofteverFitPointChartDTO {
    xAxis?: SofteverFitWalletXAxisDTO | null;
    series?: SofteverFitWalletSeriesDTO | null;
}

model SofteverFit {
    activity?: ActivityType;
    distance?: int32 | null;
    step?: int32 | null;
    calories?: int32 | null;
    performance?: Performance;
    attachment?: FileDTO | null;
    reward?: int32 | null;
    requestStatus?: RequestStatus;
}

model SofteverFitListDTO {
    ...Base;
    ...SofteverFit;
    ...BaseTablePermission;
}

model SofteverFitRequestDTO {
    ...Base;
    user?: {
        id?: UserDTO.id;
        firstNameTH?: UserDTO.firstNameTH;
        lastNameTH?: UserDTO.lastNameTH;
        position?: UserDTO.position;
    } | null;
    summary?: SofteverFitSummaryDTO;
    ...SofteverFit;
    ...BaseTablePermission;
}
