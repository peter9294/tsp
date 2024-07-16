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
    ): Success<SofteverFitListDTO[]> | Error;

    @post
    PostSofteverFit(@body body: SofteverFitListDTO): void | Error;

    @put
    PutSofteverFit(
        @format("uuid")
        @path
        id: string,

        @body body: SofteverFitListDTO,
    ): void | Error;

    @delete
    DeleteSofteverFit(
        @format("uuid")
        @path
        id: string,
    ): void | Error;

    @get
    @route("/Summary")
    GetSofteverFitSummary(): Success<SofteverFitSummaryDTO> | Error;

    @get
    @route("/WalletChart")
    GetSofteverFitWalletChart(
        @query year?: string,
        @query PeriodType?: PeriodType,
    ): Success<SofteverFitWalletChartDTO> | Error;

    @get
    @route("/PointChart")
    GetSofteverFitPointChart(
        @query year?: string,
        @query PeriodType?: PeriodType,
    ): Success<SofteverFitPointChartDTO> | Error;

    @get
    @route("/Request")
    GetSofteverFitRequest(
        @query searchTerm?: string,
        @query year?: string,
        @query performance?: Performance,
        ...SortBy<GetSofteverFitRequestSortBy>,
        ...Paging<void>,
    ): Success<SofteverFitRequestDTO[]> | Error;

    @put
    @route("/Request")
    PutSofteverFitRequest(
        @format("uuid")
        @path
        id: string,

        @body body: SofteverFitRequestDTO,
    ): void | Error;

    @post
    @route("/Request/MultipleApprove")
    PostSofteverFitRequestMultipleApprove(
        @body body: ApproveDTO[],
    ): void | Error;

    @post
    @route("/Request/MultipleDecline")
    PostSofteverFitRequestMultipleDecline(
        @body body: ApproveDTO[],
    ): void | Error;
}
