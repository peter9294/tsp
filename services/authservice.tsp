import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@route("/api/Token")
@tag("Token")
interface TokenService {
    @route("/Login")
    @post
    login(
        @header
        contentType: "application/json" | "text/json" | "application/*+json",

        @body param: LoginParam,
    ): Success<JsonWebToken>;

    @route("/Logout")
    @post
    logout(
        @header
        contentType: "application/json" | "text/json" | "application/*+json",

        @body param: LogoutParam,
    ): BaseResponse.Success | BaseResponse.Unauthorized | BaseResponse.Forbidden;
}
