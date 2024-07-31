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
    PostLifestyleWallet is PostBody<LifestyleWalletListDTO>;

    @put
    PutLifestyleWallet is PutId<LifestyleWalletListDTO>;

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
        ...TableQuery<GetLifestyleWalletRequestSortBy>,
    ): TableResponse<LifestyleWalletRequestDTO[]>;

    @put
    @route("/Request")
    PutLifestyleWalletRequest is PutId<LifestyleWalletRequestDTO>;

    @post
    @route("/Request/MultipleApprove")
    PostLifestyleWalletRequestMultipleApprove is PostBody<ApproveDTO[]>;

    @post
    @route("/Request/MultipleDecline")
    PostLifestyleWalletRequestMultipleDecline is PostBody<ApproveDTO[]>;

    @get
    @route("/Request/History")
    GetLifestyleWalletRequestHistory(
        @query department?: Department,
        @query searchTerm?: string,
        @query year?: string,
        ...TableQuery<GetLifestyleWalletRequestSortBy>,
    ): TableResponse<LifestyleWalletRequestHistoryDTO[]>;
}
