import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.StabilityAnalysis

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure ConvergencePackage {D : DifferenceOperatorPackage}
    {B : BoundaryConditionPackage D} {S : DiscretizationSchemePackage B}
    (A : StabilityAnalysisPackage S) where
  consistencyPlusStabilityImplies : Prop
  errorEstimate : ℝ → ℝ
  convergenceOrder : ℕ
  convergenceProof : Prop

structure ConvergenceEvidence {D : DifferenceOperatorPackage}
    {B : BoundaryConditionPackage D} {S : DiscretizationSchemePackage B}
    {A : StabilityAnalysisPackage S} (C : ConvergencePackage A) where
  convergenceProofClosed : C.convergenceProof
  errorEstimateClosed : C.errorEstimate 0 = 0  -- placeholder

def ConvergenceClosed {D : DifferenceOperatorPackage}
    {B : BoundaryConditionPackage D} {S : DiscretizationSchemePackage B}
    {A : StabilityAnalysisPackage S} (C : ConvergencePackage A) : Prop :=
  C.convergenceProof ∧ (∀ n : ℕ, C.errorEstimate n ≥ 0)

theorem convergence_closed_from_evidence
    {D : DifferenceOperatorPackage} {B : BoundaryConditionPackage D}
    {S : DiscretizationSchemePackage B} {A : StabilityAnalysisPackage S}
    (C : ConvergencePackage A) (E : ConvergenceEvidence C) :
    ConvergenceClosed C := by
  exact And.intro E.convergenceProofClosed (by
    intro n
    exact E.errorEstimateClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse
