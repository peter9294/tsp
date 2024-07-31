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
    ): TableResponse<LifestyleWalletListDTO[]>;

    @post
    PostLifestyleWallet(@body body: LifestyleWalletListDTO): VoidResponse;

    @put
    PutLifestyleWallet(
        @format("uuid")
        @path
        id: string,

        @body body: LifestyleWalletListDTO,
    ): VoidResponse;

    @delete
    DeleteLifestyleWallet is DeleteId;

    @get
    @route("/Summary")
    GetLifestyleWalletSummary(
        @query year?: string,
    ): NormalResponse<LifestyleWalletSummaryDTO>;

    @get
    @route("/Request")
    GetLifestyleWalletRequest(
        @query department?: Department,
        @query searchTerm?: string,
        @query year?: string,
        ...SortBy<GetLifestyleWalletRequestSortBy>,
        ...Paging<void>,
    ): TableResponse<LifestyleWalletRequestDTO[]>;

    @put
    @route("/Request")
    PutLifestyleWalletRequest(
        @format("uuid")
        @path
        id: string,

        @body body: LifestyleWalletRequestDTO,
    ): VoidResponse;

    @post
    @route("/Request/MultipleApprove")
    PostLifestyleWalletRequestMultipleApprove(
        @body body: ApproveDTO[],
    ): VoidResponse;

    @post
    @route("/Request/MultipleDecline")
    PostLifestyleWalletRequestMultipleDecline(
        @body body: ApproveDTO[],
    ): VoidResponse;

    @get
    @route("/Request/History")
    GetLifestyleWalletRequestHistory(
        @query department?: Department,
        @query searchTerm?: string,
        @query year?: string,
        ...SortBy<GetLifestyleWalletRequestSortBy>,
        ...Paging<void>,
    ): TableResponse<LifestyleWalletRequestHistoryDTO[]>;
}
