$version: "2"
namespace io.archipelag.errors

@error("client")
@httpError(401)
@documentation("*User* MUST login again.")
structure Generic401Error {
    @required
    message: String
}

@error("client")
@httpError(403)
@documentation("*User* has wrong role.")
structure Generic403Error {
    @required
    message: String
}
