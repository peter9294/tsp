import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Leave")
@route("/api/Leave")
interface Leave {
    @get
    @route("/Left")
    GetLeaveLeft(): NormalResponse<LeaveLeftDTO[]>;

    @get
    @route("/List")
    GetLeaveList(
        ...TableQuery<GetLeaveListSortBy>,
    ): TableResponse<LeaveListDTO[]>;

    @post
    CreateLeave(@body param: LeaveListDTO): VoidResponse;

    @delete
    @route("/List")
    DeleteLeaveList is DeleteId;

    @get
    @route("/History")
    GetLeaveHistory(
        @query year?: string,
        @query searchTerm?: string,
        @query leaveType?: LeaveType,
        ...SortBy<GetLeaveHistorySortBy>,
        ...Paging<void>,
    ): TableResponse<LeaveHistoryDTO[]>;

    @get
    @route("/Request")
    GetLeaveRequest(
        @query year?: string,
        @query searchTerm?: string,
        @query leaveType?: LeaveType,
        ...SortBy<GetLeaveRequestSortBy>,
        ...Paging<void>,
    ): TableResponse<LeaveRequestDTO[]>;

    @post
    @route("/Request/MultipleApprove")
    PostLeaveRequestMultipleApprove(@body body: ApproveDTO[]): VoidResponse;

    @post
    @route("/Request/MultipleDecline")
    PostLeaveRequestMultipleDecline(@body body: ApproveDTO[]): VoidResponse;

    @get
    @route("/Management/List")
    GetLeaveManagementList(
        @query year?: string,
        @query searchTerm?: string,
        @query department?: Department,
        ...SortBy<GetLeaveManagementListSortBy>,
        ...Paging<void>,
    ): TableResponse<LeaveManagementDTO[]>;

    @get
    @route("/Management")
    GetLeaveManagement(
        @format("uuid") @path id: string,
        @query year?: string,
    ): NormalResponse<LeaveManagementDTO>;

    @put
    @route("/Management")
    PutLeaveManagement(
        @format("uuid") @path id: string,
        @body body: LeaveManagementDTO,
    ): VoidResponse;

    @post
    @route("/Management/MultipleDelete")
    DeleteMultipleLeaveManagement(
        @body body: {
            @format("uuid") id: string;
        }[],
    ): VoidResponse;
}
