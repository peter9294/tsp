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
        ...SortBy<GetSofteverFitListSortBy>,
        ...Paging<void>,
    ): TableResponse<SofteverFitListDTO[]>;

    @post
    PostSofteverFit(@body body: SofteverFitListDTO): VoidResponse;

    @put
    PutSofteverFit(
        @format("uuid")
        @path
        id: string,

        @body body: SofteverFitListDTO,
    ): VoidResponse;

    @delete
    DeleteSofteverFit(
        @format("uuid")
        @path
        id: string,
    ): VoidResponse;

    @get
    @route("/Summary")
    GetSofteverFitSummary(): NormalResponse<SofteverFitSummaryDTO>;

    @get
    @route("/WalletChart")
    GetSofteverFitWalletChart(
        @query year?: string,
        @query PeriodType?: PeriodType,
    ): NormalResponse<SofteverFitWalletChartDTO>;

    @get
    @route("/PointChart")
    GetSofteverFitPointChart(
        @query year?: string,
        @query PeriodType?: PeriodType,
    ): NormalResponse<SofteverFitPointChartDTO>;

    @get
    @route("/Request")
    GetSofteverFitRequest(
        @query searchTerm?: string,
        @query year?: string,
        @query performance?: Performance,
        ...SortBy<GetSofteverFitRequestSortBy>,
        ...Paging<void>,
    ): TableResponse<SofteverFitRequestDTO[]>;

    @put
    @route("/Request")
    PutSofteverFitRequest(
        @format("uuid")
        @path
        id: string,

        @body body: SofteverFitRequestDTO,
    ): VoidResponse;

    @post
    @route("/Request/MultipleApprove")
    PostSofteverFitRequestMultipleApprove(
        @body body: ApproveDTO[],
    ): VoidResponse;

    @post
    @route("/Request/MultipleDecline")
    PostSofteverFitRequestMultipleDecline(
        @body body: ApproveDTO[],
    ): VoidResponse;
}
