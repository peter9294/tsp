import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Report")
@route("/api/Report")
interface Report {
    @get
    @route("/TotalEmployee")
    GetTotalEmployee(): NormalResponse<TotalEmployeeDTO[]>;

    @get
    @route("TotaLifestyleWallet")
    GetTotalLifestyleWallet(): NormalResponse<TotalLifestyleWalletDTO[]>;

    @get
    @route("TotalPayment")
    GetTotalPayment(): NormalResponse<TotalPaymentDTO[]>;

    // @get
    // @route("/List")
    // GetReportList(
    //     ...TableQuery<GetReportListSortBy>,
    // ): TableResponse<ReportListDTO[]>;

    // @post
    // CreateReport is PostBody<ReportListDTO>;

    // @delete
    // @route("/List")
    // DeleteReportList is DeleteId;

    // @get
    // @route("/History")
    // GetReportHistory(
    //     @query year?: string,
    //     @query searchTerm?: string,
    //     @query leaveType?: ReportType,
    //     ...TableQuery<GetReportHistorySortBy>,
    // ): TableResponse<ReportHistoryDTO[]>;

    // @get
    // @route("/Request")
    // GetReportRequest(
    //     @query year?: string,
    //     @query searchTerm?: string,
    //     @query leaveType?: ReportType,
    //     ...TableQuery<GetReportRequestSortBy>,
    // ): TableResponse<ReportRequestDTO[]>;

    // @post
    // @route("/Request/MultipleApprove")
    // PostReportRequestMultipleApprove is PostBody<ApproveDTO[]>;

    // @post
    // @route("/Request/MultipleDecline")
    // PostReportRequestMultipleDecline is PostBody<ApproveDTO[]>;

    // @get
    // @route("/Management/List")
    // GetReportManagementList(
    //     @query year?: string,
    //     @query searchTerm?: string,
    //     @query department?: Department,
    //     ...TableQuery<GetReportManagementListSortBy>,
    // ): TableResponse<ReportManagementDTO[]>;

    // @get
    // @route("/Management")
    // GetReportManagement(
    //     @format("uuid") @path id: string,
    //     @query year?: string,
    // ): NormalResponse<ReportManagementDTO>;

    // @put
    // @route("/Management")
    // PutReportManagement is PutId<ReportManagementDTO>;

    // @post
    // @route("/Management/MultipleDelete")
    // DeleteMultipleReportManagement(
    //     @body body: {
    //         @format("uuid") id: string;
    //     }[],
    // ): VoidResponse;
}
