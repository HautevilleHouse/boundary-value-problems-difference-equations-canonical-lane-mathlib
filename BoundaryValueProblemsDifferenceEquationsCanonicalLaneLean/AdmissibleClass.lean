import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure DifferenceEquationAdmittedObject where
  domain : Type
  grid : Type
  differenceOperator : Type
  boundaryCondition : Type
  solutionExists : Prop
  unique : Prop
  stable : Prop

structure AdmissibleClass where
  object : DifferenceEquationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.solutionExists ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse