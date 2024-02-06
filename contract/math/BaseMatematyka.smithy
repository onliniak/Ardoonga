$version: "2"
namespace io.archipelag.matematyka

service MatematykaBase {
  @required
  version: "0.1"
  operations: [GetMathFunction]
}

operation GetMathFunction {
  input:  MathFunctionInput
  output: MathFunctionOutput
}

@output
structure MathFunctionOutput {
    math: Integer
}

@output
structure MathFunctionInput {
    user: User
}
