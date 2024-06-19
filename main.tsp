import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi3";

import "./model";
import "./services";

using Http;

@service({
    title: "Softever HR",
})
@server("https://softever-hr-dev.softever.co.th/develop/backend", "")
@useAuth(Bearer)
namespace SofteverHR;
