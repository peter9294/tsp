import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./model";
import "./services";

using Http;

@service({
    title: "SampleProject",
})
@server("https://dev-softeverhr.softever.co.th/develop/backend", "")
@useAuth(Bearer)
namespace SampleProject;
