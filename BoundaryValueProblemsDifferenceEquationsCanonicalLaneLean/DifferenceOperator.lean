import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure DifferenceOperatorPackage where
  operatorType : Type
  order : Nat
  coefficients : List ℝ
  discretization : Prop
  consistency : Prop
  stability : Prop

structure DifferenceOperatorEvidence (D : DifferenceOperatorPackage) where
  discretizationClosed : D.discretization
  consistencyClosed : D.consistency
  stabilityClosed : D.stability

def DifferenceOperatorClosed (D : DifferenceOperatorPackage) : Prop :=
  D.discretization ∧ D.consistency ∧ D.stability

theorem difference_operator_closed_from_evidence (D : DifferenceOperatorPackage) (E : DifferenceOperatorEvidence D) :
    DifferenceOperatorClosed D := by
  exact And.intro E.discretizationClosed (And.intro E.consistencyClosed E.stabilityClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse