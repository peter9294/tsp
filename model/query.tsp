import "@typespec/http";

using Http;

namespace CustomQuery;

model SortBy<Item extends Reflection.Enum> {
    @query sortBy?: Item;
    @query ascending?: boolean;
}

model Paging {
    @query page?: int32;
    @query pageSize?: int32;
}
