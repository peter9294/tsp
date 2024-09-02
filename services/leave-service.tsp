import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Leave")
@route("/api/Leave")
interface Leave {
    @get
    @route("/Left")
    GetLeaveLeft(@query userId?: string): NormalResponse<LeaveLeftDTO[]>;

    @get
    @route("/List")
    GetLeaveList(
        ...TableQuery<GetLeaveListSortBy>,
    ): TableResponse<LeaveListDTO[]>;

    @post
    CreateLeave is PostBody<LeaveListDTO>;

    @delete
    @route("/List")
    DeleteLeaveList is DeleteId;

    @get
    @route("/History")
    GetLeaveHistory(
        @query userId?: string,
        @query year?: string,
        @query searchTerm?: string,
        @query leaveType?: LeaveType,
        ...TableQuery<GetLeaveHistorySortBy>,
    ): TableResponse<LeaveHistoryDTO[]>;

    @get
    @route("/Request")
    GetLeaveRequest(
        @query year?: string,
        @query searchTerm?: string,
        @query leaveType?: LeaveType,
        ...TableQuery<GetLeaveRequestSortBy>,
    ): TableResponse<LeaveRequestDTO[]>;

    @post
    @route("/Request/MultipleApprove")
    PostLeaveRequestMultipleApprove is PostBody<ApproveDTO[]>;

    @post
    @route("/Request/MultipleDecline")
    PostLeaveRequestMultipleDecline is PostBody<ApproveDTO[]>;

    @get
    @route("/Management/List")
    GetLeaveManagementList(
        @query year?: string,
        @query searchTerm?: string,
        @query department?: Department,
        ...TableQuery<GetLeaveManagementListSortBy>,
    ): TableResponse<LeaveManagementDTO[]>;

    @get
    @route("/Management")
    GetLeaveManagement(
        @format("uuid") @path id: string,
        @query year?: string,
    ): NormalResponse<LeaveManagementDTO>;

    @put
    @route("/Management")
    PutLeaveManagement is PutId<LeaveManagementDTO>;

    @post
    @route("/Management/MultipleDelete")
    DeleteMultipleLeaveManagement(
        @body body: {
            @format("uuid") id: string;
        }[],
    ): VoidResponse;
}
