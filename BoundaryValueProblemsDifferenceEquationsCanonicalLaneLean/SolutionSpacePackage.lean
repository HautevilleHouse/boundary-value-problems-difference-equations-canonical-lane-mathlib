import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.DifferenceEquationPackage
import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.BoundaryConditionPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure SolutionSpacePackage {D : DifferenceEquationPackage}
    {B : BoundaryConditionPackage D} where
  solutionSet : Type
  linearStructure : Prop
  dimension : ℕ
  existence : Prop
  uniqueness : Prop

structure SolutionSpaceEvidence {D : DifferenceEquationPackage}
    {B : BoundaryConditionPackage D} (S : SolutionSpacePackage D B) where
  linearStructureClosed : S.linearStructure
  dimensionClosed : S.dimension = S.dimension
  existenceClosed : S.existence
  uniquenessClosed : S.uniqueness

def SolutionSpaceClosed {D : DifferenceEquationPackage}
    {B : BoundaryConditionPackage D} (S : SolutionSpacePackage D B) : Prop :=
  S.existence ∧ S.uniqueness ∧ S.linearStructure

theorem solution_space_closed_from_evidence {D : DifferenceEquationPackage}
    {B : BoundaryConditionPackage D} (S : SolutionSpacePackage D B)
    (E : SolutionSpaceEvidence S) : SolutionSpaceClosed S := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed E.linearStructureClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse