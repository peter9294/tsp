import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Leave")
@route("/api/Leave")
interface Leave {
    @get
    @route("/Left")
    GetLeaveLeft(): Success<LeaveLeftDTO[]> | Error;

    @get
    @route("/List")
    GetLeaveList(
        ...SortBy<GetLeaveListSortBy>,
        ...Paging<void>,
    ): (Success<LeaveListDTO[]> & HeadersPaging) | Error;

    @post
    CreateLeave(@body param: LeaveListDTO): void | Error;

    @delete
    @route("/List")
    DeleteLeaveList(@format("uuid") @path id: string): void | Error;

    @get
    @route("/History")
    GetLeaveHistory(
        @query year?: string,
        @query searchTerm?: string,
        @query leaveType?: LeaveType,
        ...SortBy<GetLeaveHistorySortBy>,
        ...Paging<void>,
    ): (Success<LeaveHistoryDTO[]> & HeadersPaging) | Error;

    @get
    @route("/Request")
    GetLeaveRequest(
        @query year?: string,
        @query searchTerm?: string,
        @query leaveType?: LeaveType,
        ...SortBy<GetLeaveRequestSortBy>,
        ...Paging<void>,
    ): (Success<LeaveRequestDTO[]> & HeadersPaging) | Error;

    @post
    @route("/Request/MultipleApprove")
    PostLeaveRequestMultipleApprove(@body body: ApproveDTO[]): void | Error;

    @post
    @route("/Request/MultipleDecline")
    PostLeaveRequestMultipleDecline(@body body: ApproveDTO[]): void | Error;

    @get
    @route("/Management/List")
    GetLeaveManagementList(
        @query year?: string,
        @query searchTerm?: string,
        @query department?: Department,
        ...SortBy<GetLeaveManagementListSortBy>,
        ...Paging<void>,
    ): (Success<LeaveManagementDTO[]> & HeadersPaging) | Error;

    @get
    @route("/Management")
    GetLeaveManagement(
        @format("uuid") @path id: string,
        @query year?: string,
    ): Success<LeaveManagementDTO> | Error;

    @put
    @route("/Management")
    PutLeaveManagement(
        @format("uuid") @path id: string,
        @body body: LeaveManagementDTO,
    ): void | Error;

    @post
    @route("/Management/MultipleDelete")
    DeleteMultipleLeaveManagement(
        @body body: {
            @format("uuid") id: string;
        }[],
    ): void | Error;
}
