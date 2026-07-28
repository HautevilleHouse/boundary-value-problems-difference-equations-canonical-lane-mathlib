import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure DifferenceEquationSpace where
  dimension : Nat
  gridPoints : Nat
  topology : Prop
  discreteMetric : Prop

structure BoundaryValueProblem where
  space : DifferenceEquationSpace
  equationType : String
  boundaryCondition : String
  linear : Prop
  wellPosed : Prop
  solutionSpace : Type
  conclusion : solutionSpace

structure BVPEndgameState where
  object : BoundaryValueProblem

def BVPWitnessClosed (O : BoundaryValueProblem) : Prop :=
  O.wellPosed

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse