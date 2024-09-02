import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;

@tag("SofteverFit")
@route("/api/SofteverFit")
interface SofteverFit {
    @get
    @route("/List")
    GetSofteverFitList(
        @query month?: string,
        @query performance?: Performance,
        ...TableQuery<GetSofteverFitListSortBy>,
    ): TableResponse<SofteverFitListDTO[]>;

    @post
    PostSofteverFit is PostBody<SofteverFitListDTO>;

    @put
    PutSofteverFit is PutId<SofteverFitListDTO>;

    @delete
    DeleteSofteverFit is DeleteId;

    @get
    @route("/Summary")
    GetSofteverFitSummary(): NormalResponse<SofteverFitSummaryDTO>;

    @get
    @route("/WalletChart")
    GetSofteverFitWalletChart(
        @query userId?: string,
        @query year?: string,
        @query PeriodType?: PeriodType,
    ): NormalResponse<SofteverFitWalletChartDTO>;

    @get
    @route("/PointChart")
    GetSofteverFitPointChart(
        @query userId?: string,
        @query year?: string,
        @query PeriodType?: PeriodType,
    ): NormalResponse<SofteverFitPointChartDTO>;

    @get
    @route("/Request")
    GetSofteverFitRequest(
        @query userId?: string,
        @query searchTerm?: string,
        @query year?: string,
        @query performance?: Performance,
        ...TableQuery<GetSofteverFitRequestSortBy>,
    ): TableResponse<SofteverFitRequestDTO[]>;

    @put
    @route("/Request")
    PutSofteverFitRequest is PutId<SofteverFitRequestDTO>;

    @post
    @route("/Request/MultipleApprove")
    PostSofteverFitRequestMultipleApprove is PostBody<ApproveDTO[]>;

    @post
    @route("/Request/MultipleDecline")
    PostSofteverFitRequestMultipleDecline is PostBody<ApproveDTO[]>;
}
