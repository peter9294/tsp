import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SampleProject.Services;
@tag("Files")
@route("/api/Files")
interface Files {
    @post
    @route("/Upload")
    @summary("อัปโหลดไฟล์")
    Upload(
        @header contentType: "multipart/form-data",
        @body body?: {
            @encode("binary")
            file?: bytes;
        },
    ): NormalResponse<FileDTO>;

    @post
    @route("/MultipleUpload")
    @summary("อัปโหลดทีละหลายไฟล์")
    MultipleUpload(
        @header contentType: "multipart/form-data",
        @body body?: {
            @encode("binary")
            files?: Array<bytes>;
        },
    ): NormalResponse<FileDTO[]>;
}
