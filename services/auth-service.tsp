import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@route("/api/Token")
@tag("Token")
interface Token {
    @route("/Login")
    @post
    Login(
        @header
        contentType: "application/json" | "text/json" | "application/*+json",

        @body param: LoginParam,
    ): Success<JsonWebToken>;

    @route("/Logout")
    @post
    Logout(
        @header
        contentType: "application/json" | "text/json" | "application/*+json",

        @body param: LogoutParam,
    ): BaseResponse.Success | BaseResponse.Unauthorized | BaseResponse.Forbidden;
}
