enum RequestStatus {
    PENDING: "Pending",
    APPROVE: "Approve",
    REJECT: "Reject",
}

model ApproveDTO {
    @format("uuid") id: string | null;
    requestStatus: RequestStatus;
    reason?: string | null;
}
