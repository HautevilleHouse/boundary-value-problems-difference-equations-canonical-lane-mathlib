import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure StabilityAnalysisPackage where
  method : Type
  vonNeumannCondition : Prop
  laxEquivalence : Prop
  convergence : Prop

structure StabilityAnalysisEvidence (S : StabilityAnalysisPackage) where
  vonNeumannConditionClosed : S.vonNeumannCondition
  laxEquivalenceClosed : S.laxEquivalence
  convergenceClosed : S.convergence

def StabilityAnalysisClosed (S : StabilityAnalysisPackage) : Prop :=
  S.vonNeumannCondition ∧ S.laxEquivalence ∧ S.convergence

theorem stability_analysis_closed_from_evidence (S : StabilityAnalysisPackage) (E : StabilityAnalysisEvidence S) :
    StabilityAnalysisClosed S := by
  exact And.intro E.vonNeumannConditionClosed (And.intro E.laxEquivalenceClosed E.convergenceClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse