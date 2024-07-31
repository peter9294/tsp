import "@typespec/http";

using Http;

op PostBody<Body extends Reflection.Model>(@body body: Body): VoidResponse;

op GetId<SuccessBody extends Reflection.Model>(
    @format("uuid") @path id: string,
): NormalResponse<SuccessBody>;

op DeleteId(@format("uuid") @path id: string): VoidResponse;

op PutId<Body extends Reflection.Model>(
    @format("uuid") @path id: string,
    @body body: Body,
): VoidResponse;
