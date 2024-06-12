import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Leave")
@route("/api/Leave")
interface Leave {
    @get
    @route("/Card")
    GetLeaveCard(): Success<LeaveAvaliabilityCardDTO[]> | Error;

    @get
    @route("/List")
    GetLeaveList(
        ...SortBy<GetLeaveListSortBy>,
        ...Paging<void>,
    ): (Success<LeaveListDTO[]> & HeadersPaging) | Error;

    @post
    CreateLeave(@body param: LeaveListDTO): void | Error;

    @delete
    @route("/list")
    DeleteLeaveList(@path id: string): void | Error;
}
