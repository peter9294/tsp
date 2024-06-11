import "@typespec/http";

import "../model/main.tsp";

using Http;

namespace SofteverHR.Services;
@tag("Files")
@route("/api/Files")
interface FilesService {
    @post
    @route("/Upload")
    @summary("อัปโหลดไฟล์")
    upload(
        @header contentType: "multipart/form-data",
        @body body?: {
            @encode("binary")
            file?: bytes;
        },
    ): Success<FileDTO> | Error;

    @post
    @route("/MultipleUpload")
    @summary("อัปโหลดทีละหลายไฟล์")
    multipleUpload(
        @header contentType: "multipart/form-data",
        @body body?: {
            @encode("binary")
            files?: Array<bytes>;
        },
    ): Success<FileDTO[]> | Error;
}
