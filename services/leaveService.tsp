import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Leave")
@route("/api/Leave")
interface LeaveService {
    @get
    @route("/Card")
    getLeaveCard(): Success<LeaveAvailabilityCardDTO[]> | Error;

    @get
    @route("/List")
    getLeaveList(
        ...SortBy<GetLeaveListSortBy>,
        ...Paging<void>,
    ): (Success<LeaveListDTO[]> & HeadersPaging) | Error;

    @post
    createLeave(@body param: LeaveListDTO): void | Error;

    @delete
    @route("/list")
    deleteLeaveList(@path id: string): void | Error;
}
