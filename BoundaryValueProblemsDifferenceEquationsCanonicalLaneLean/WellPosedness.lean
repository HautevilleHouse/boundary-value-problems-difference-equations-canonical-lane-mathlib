import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.Convergence

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure WellPosednessPackage {D : DifferenceOperatorPackage}
    {B : BoundaryConditionPackage D} {S : DiscretizationSchemePackage B}
    {A : StabilityAnalysisPackage S} (C : ConvergencePackage A) where
  existence : Prop
  uniqueness : Prop
  continuousDependence : Prop
  wellPosednessConclusion : Prop

structure WellPosednessEvidence {D : DifferenceOperatorPackage}
    {B : BoundaryConditionPackage D} {S : DiscretizationSchemePackage B}
    {A : StabilityAnalysisPackage S} {C : ConvergencePackage A}
    (W : WellPosednessPackage C) where
  existenceClosed : W.existence
  uniquenessClosed : W.uniqueness
  continuousDependenceClosed : W.continuousDependence

def WellPosednessClosed {D : DifferenceOperatorPackage}
    {B : BoundaryConditionPackage D} {S : DiscretizationSchemePackage B}
    {A : StabilityAnalysisPackage S} {C : ConvergencePackage A}
    (W : WellPosednessPackage C) : Prop :=
  W.existence ∧ W.uniqueness ∧ W.continuousDependence

theorem well_posedness_closed_from_evidence
    {D : DifferenceOperatorPackage} {B : BoundaryConditionPackage D}
    {S : DiscretizationSchemePackage B} {A : StabilityAnalysisPackage S}
    {C : ConvergencePackage A} (W : WellPosednessPackage C)
    (E : WellPosednessEvidence W) : WellPosednessClosed W := by
  exact And.intro E.existenceClosed (And.intro E.uniquenessClosed E.continuousDependenceClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse
