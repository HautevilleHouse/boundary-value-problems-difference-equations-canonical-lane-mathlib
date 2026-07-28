import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.DifferenceEquationsObjects
import HautevilleHouse.BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.BVPStatement

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure DifferenceOperatorCertificate (B : BoundaryValueProblem) where
  operatorConstruction : Prop
  boundaryDiscretization : Prop
  stabilityAnalysis : Prop
  convergenceRate : Prop
  operatorConstructionClosed : operatorConstruction
  boundaryDiscretizationClosed : boundaryDiscretization
  stabilityAnalysisClosed : stabilityAnalysis
  convergenceRateClosed : convergenceRate
  bvpEvidence : B.wellPosed

def DifferenceOperatorCertificateClosed {B : BoundaryValueProblem} (C : DifferenceOperatorCertificate B) : Prop :=
  C.operatorConstruction ∧ C.boundaryDiscretization ∧ C.stabilityAnalysis ∧ C.convergenceRate

theorem difference_operator_certificate_closed
    {B : BoundaryValueProblem} (C : DifferenceOperatorCertificate B) :
    DifferenceOperatorCertificateClosed C := by
  exact And.intro C.operatorConstructionClosed
    (And.intro C.boundaryDiscretizationClosed
      (And.intro C.stabilityAnalysisClosed C.convergenceRateClosed))

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse