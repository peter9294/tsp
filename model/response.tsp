import "@typespec/http";

using Http;

namespace CustomResponse {
    model Success<body extends Reflection.Model> {
        @header contentType: Headers.contentType;
        ...BaseResponse.Success;
        @body body: body;
    }

    alias Error = BaseResponse.Unauthorized | BaseResponse.Forbidden | BaseResponse.ServerError;

    namespace BaseResponse {
        alias Success = OkResponse; // 200
        alias Unauthorized = UnauthorizedResponse; // 401
        alias Forbidden = ForbiddenResponse; // 403
        model ServerError {
            @statusCode statusCode: 500;
            @header contentType: Headers.contentType;
            @body error: CustomError.ErrorReponse;
        }
    }
}
