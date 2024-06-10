import "@typespec/http";

using Http;

model HeadersPaging {
    @doc("Page No")
    @header("X-Paging-PageNo")
    xPagingPageNo: integer;

    @doc("Page Size")
    @header("X-Paging-PageSize")
    xPagingPageSize: integer;

    @doc("Paging Page Count")
    @header("X-Paging-PageCount")
    xPagingPageCount: integer;

    @doc("Total Record Count")
    @header("X-Paging-TotalRecordCount")
    xPagingTotalRecordCount: integer;
}

alias contentType = "text/plain" | "application/json" | "text/json";
