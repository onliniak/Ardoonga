@documentation("Create *potions* from *plants*.")
service AlchemyBase {
    @required
    version: "0.1"
    operations: [GetPotionIndex, GetPotionNew, PostPotionCreate]
}

@documentation("Display a list of all *potions*. Display list of available *plants* in *inventory*.")
@http(method: "GET", uri: "/alchemy")
operation GetPotionIndex {
    output: GetServiceOutput
}

@documentation("Return an HTML form for creating the *potion*.")
@http(method: "GET", uri: "/alchemy/{potionID}")
operation GetPotionNew {
    output: GetServiceOutput
}

@documentation("Create new *potion*. Remove *plants* from *inventory*.")
@http(method: "POST", uri: "/alchemy/{potionID}")
operation PostPotionCreate {
    output: GetServiceOutput
}
