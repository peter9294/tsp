import "@typespec/http";

using Http;

op DeleteId(@format("uuid") @path id: string): VoidResponse;
