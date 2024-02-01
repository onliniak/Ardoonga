$version: "2"
namespace io.archipelag.alchemy

use io.archipelag.error#Generic401Error

@documentation("Create *plants* from *fields* on *farm(land)*.")
@httpApiKeyAuth(scheme: "ApiKey", name: "Authorization", in: "header")
service HarvestBase {
    @required
    version: "0.1"
    operations: [GetFarmlandIndex, PostFarmlandIndex, GetHarvestIndex, GetHarvestShow, 
                PostHarvestCreate, PostHarvestNew, DeleteHarvestDestroy]
    errors: [Generic401Error]
}

@optionalAuth
@documentation("*User* is not *farmland* owner. Return HTML form with new *farmland* creation.")
@http(method: "GET", uri: "/farm")
operation GetFarmlandIndex {
    output: MyFarmlandFieldsOutputHTML
    errors: [NoMoneyError]
}

@output
structure MyOperationOutput {}

@error("client")
@httpError(403)
structure NoMoneyError {
    @required
    message: String
}

@optionalAuth
@documentation("Create new *farmland* with 1 *field*")
@http(method: "POST", uri: "/farm")
operation PostFarmlandIndex {
    output: MyFarmlandFieldsOutput
    errors: [NotFarmOwnerError]
}

@documentation("Display a list of all *fields*.")
@http(method: "GET", uri: "/farm")
operation GetHarvestIndex {
    output: MyFarmlandFieldsOutput
    errors: [NotFarmOwnerError]
}

@documentation("Display single *field*. Allow delete or create new *plants*.")
@http(method: "GET", uri: "/farm/{fieldID}")
operation GetHarvestShow {
    input: MyOperationInput
    output: MyOperationOutput
    errors: [NotFoundError, BadRequestError]
}

@documentation("Create new *plants* on this *field*.")
@http(method: "POST", uri: "/farm/{fieldID}")
operation PostHarvestCreate {
    output: GetServiceOutput
}

@documentation("Create new *fields*.")
@http(method: "POST", uri: "/farm/{fieldsNumber}")
operation PostHarvestNew {
    output: GetServiceOutput
}

@documentation("Delete this *field*. Move all *plants* to *inventory*.")
@http(method: "DELETE", uri: "/farm/{fieldID}")
operation DeleteHarvestDestroy {
    output: GetServiceOutput
}
