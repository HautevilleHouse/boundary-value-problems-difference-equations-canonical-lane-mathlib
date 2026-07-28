import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.BoundaryCondition

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure DiscretizationSchemePackage {D : DifferenceOperatorPackage}
    (B : BoundaryConditionPackage D) where
  schemeType : String
  truncationError : ℝ
  consistency : Prop
  stability : Prop
  convergence : Prop

structure DiscretizationSchemeEvidence {D : DifferenceOperatorPackage}
    {B : BoundaryConditionPackage D} (S : DiscretizationSchemePackage B) where
  consistencyClosed : S.consistency
  stabilityClosed : S.stability
  convergenceClosed : S.convergence

def DiscretizationSchemeClosed {D : DifferenceOperatorPackage}
    {B : BoundaryConditionPackage D} (S : DiscretizationSchemePackage B) : Prop :=
  S.consistency ∧ S.stability ∧ S.convergence

theorem discretization_scheme_closed_from_evidence
    {D : DifferenceOperatorPackage} {B : BoundaryConditionPackage D}
    (S : DiscretizationSchemePackage B) (E : DiscretizationSchemeEvidence S) :
    DiscretizationSchemeClosed S := by
  exact And.intro E.consistencyClosed (And.intro E.stabilityClosed E.convergenceClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse
