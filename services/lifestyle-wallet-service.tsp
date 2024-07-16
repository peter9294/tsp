import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;

@tag("LifestyleWallet")
@route("/api/LifestyleWallet")
interface LifestyleWallet {
    @get
    @route("/List")
    GetLifestyleWalletList(
        ...SortBy<GetLifestyleWalletListSortBy>,
        ...Paging<void>,
    ): Success<LifestyleWalletListDTO[]> | Error;

    @post
    PostLifestyleWallet(@body body: LifestyleWalletListDTO): void | Error;

    @put
    PutLifestyleWallet(
        @format("uuid")
        @path
        id: string,

        @body body: LifestyleWalletListDTO,
    ): void | Error;

    @delete
    DeleteLifestyleWallet(
        @format("uuid")
        @path
        id: string,
    ): void | Error;

    @get
    @route("/Summary")
    GetLifestyleWalletSummary(
        @query year?: string,
    ): Success<LifestyleWalletSummaryDTO> | Error;

    @get
    @route("/Request")
    GetLifestyleWalletRequest(
        @query department?: Department,
        @query searchTerm?: string,
        @query year?: string,
        ...SortBy<GetLifestyleWalletRequestSortBy>,
        ...Paging<void>,
    ): Success<LifestyleWalletRequestDTO[]> | Error;

    @put
    @route("/Request")
    PutLifestyleWalletRequest(
        @format("uuid")
        @path
        id: string,

        @body body: LifestyleWalletRequestDTO,
    ): void | Error;

    @post
    @route("/Request/MultipleApprove")
    PostLifestyleWalletRequestMultipleApprove(
        @body body: ApproveDTO[],
    ): void | Error;

    @post
    @route("/Request/MultipleDecline")
    PostLifestyleWalletRequestMultipleDecline(
        @body body: ApproveDTO[],
    ): void | Error;

    @get
    @route("/Request/History")
    GetLifestyleWalletRequestHistory(
        @query department?: Department,
        @query searchTerm?: string,
        @query year?: string,
        ...SortBy<GetLifestyleWalletRequestSortBy>,
        ...Paging<void>,
    ): Success<LifestyleWalletRequestHistoryDTO[]> | Error;
}
