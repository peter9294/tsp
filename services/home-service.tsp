import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;

@tag("Home")
@route("/api/Home")
interface Home {
    @get
    @route("/LifestyleWalletSummary")
    GetLifestyleWalletSummary(
        @query year?: string,
    ): Success<LifestyleWalletSummaryDTO> | Error;

    @get
    @route("/BirthMonthRemaining")
    GetBirthMonthRemaining(): Success<BirthMonthRemainingDTO> | Error;
}
