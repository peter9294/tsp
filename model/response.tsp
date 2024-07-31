import "@typespec/http";

using Http;

model Success<body extends Reflection.Model> {
    @header contentType: contentType;
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
        @header contentType: contentType;
        @body error: ErrorReponse;
    }
}

alias NormalResponse<successBody extends Reflection.Model> = Success<successBody> | Error;

alias TableResponse<successBody extends Reflection.Model> = (Success<successBody> &
    HeadersPaging) | Error;

alias VoidResponse = void | Error;
