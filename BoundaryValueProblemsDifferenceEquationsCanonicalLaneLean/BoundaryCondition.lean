import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure BoundaryConditionPackage where
  boundaryType : Type
  condition : Prop
  wellPosed : Prop
  compatibility : Prop

structure BoundaryConditionEvidence (B : BoundaryConditionPackage) where
  conditionClosed : B.condition
  wellPosedClosed : B.wellPosed
  compatibilityClosed : B.compatibility

def BoundaryConditionClosed (B : BoundaryConditionPackage) : Prop :=
  B.condition ∧ B.wellPosed ∧ B.compatibility

theorem boundary_condition_closed_from_evidence (B : BoundaryConditionPackage) (E : BoundaryConditionEvidence B) :
    BoundaryConditionClosed B := by
  exact And.intro E.conditionClosed (And.intro E.wellPosedClosed E.compatibilityClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse