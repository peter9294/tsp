model Base {
    @format("uuid") id?: string | null;
    created?: utcDateTime | null;
    updated?: utcDateTime | null;
}

model ApproveDTO {
    @format("uuid") id: string | null;
    requestStatus: RequestStatus;
    reason?: string | null;
}
