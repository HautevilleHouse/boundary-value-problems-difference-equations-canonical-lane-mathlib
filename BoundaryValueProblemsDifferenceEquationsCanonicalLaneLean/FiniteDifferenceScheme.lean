import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure FiniteDifferenceSchemePackage where
  schemeType : Type
  consistencyOrder : Nat
  stability : Prop
  accuracy : Prop

structure FiniteDifferenceSchemeEvidence (F : FiniteDifferenceSchemePackage) where
  consistencyOrderClosed : F.consistencyOrder = 2
  stabilityClosed : F.stability
  accuracyClosed : F.accuracy

def FiniteDifferenceSchemeClosed (F : FiniteDifferenceSchemePackage) : Prop :=
  F.consistencyOrder = 2 ∧ F.stability ∧ F.accuracy

theorem finite_difference_scheme_closed_from_evidence (F : FiniteDifferenceSchemePackage) (E : FiniteDifferenceSchemeEvidence F) :
    FiniteDifferenceSchemeClosed F := by
  exact And.intro E.consistencyOrderClosed (And.intro E.stabilityClosed E.accuracyClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse