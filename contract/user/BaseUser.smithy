$version: "2"
namespace io.archipelag.user

structure CurrentUser {
  id: Integer
  map Owner {
    farm: boolean
  }
}

structure SecretUser {
  email: String
  password: String
}
