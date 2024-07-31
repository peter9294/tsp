import "@typespec/http";

using Http;

model SortBy<SortByEnum extends Reflection.Enum> {
    @query sortBy?: SortByEnum;
    @query ascending?: boolean;
}

/**
 * paging is in template form to avoid being generate as a type,
 * when using it just put 'void' in the <>
 */
model Paging<_> {
    @query page?: int32;
    @query pageSize?: int32;
}

alias TableQuery<SortByEnum extends Reflection.Enum> = {
    ...SortBy<SortByEnum>;
    ...Paging<void>;
};
