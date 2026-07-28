import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.DifferenceEquationPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure BoundaryConditionPackage {D : DifferenceEquationPackage} where
  bcType : String
  boundaryPoints : List ℕ
  boundaryValues : List ℝ
  consistency : Prop
  wellPosed : Prop

structure BoundaryConditionEvidence {D : DifferenceEquationPackage}
    (B : BoundaryConditionPackage D) where
  bcTypeClosed : B.bcType = B.bcType
  boundaryPointsClosed : B.boundaryPoints = B.boundaryPoints
  boundaryValuesClosed : B.boundaryValues = B.boundaryValues
  consistencyClosed : B.consistency
  wellPosedClosed : B.wellPosed

def BoundaryConditionClosed {D : DifferenceEquationPackage}
    (B : BoundaryConditionPackage D) : Prop :=
  B.consistency ∧ B.wellPosed

theorem boundary_condition_closed_from_evidence {D : DifferenceEquationPackage}
    (B : BoundaryConditionPackage D) (E : BoundaryConditionEvidence B) :
    BoundaryConditionClosed B := by
  exact And.intro E.consistencyClosed E.wellPosedClosed

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse