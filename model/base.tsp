model Base {
    @format("uuid") id?: string | null;
    created?: utcDateTime | null;
    updated?: utcDateTime | null;
}

model ApproveDTO {
    @format("uuid") id: string | null;
    requestStatus: RequestStatus.APPROVE | RequestStatus.REJECT;
    reason?: string | null;
}
