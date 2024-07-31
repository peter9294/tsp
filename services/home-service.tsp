import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;

@tag("Home")
@route("/api/Home")
interface Home {
    @get
    @route("/BirthMonthRemaining")
    GetBirthMonthRemaining(): NormalResponse<BirthMonthRemainingDTO>;
}
