import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure DifferenceEquationPackage where
  order : Nat
  coefficients : List (ℕ → ℝ)
  initialConditions : List ℝ
  linearity : Prop
  homogeneous : Prop
  explicitForm : Prop

structure DifferenceEquationEvidence (D : DifferenceEquationPackage) where
  orderClosed : D.order = D.order
  coefficientsClosed : D.coefficients = D.coefficients
  initialConditionsClosed : D.initialConditions = D.initialConditions
  linearityClosed : D.linearity
  homogeneousClosed : D.homogeneous
  explicitFormClosed : D.explicitForm

def DifferenceEquationClosed (D : DifferenceEquationPackage) : Prop :=
  D.linearity ∧ D.homogeneous ∧ D.explicitForm

theorem difference_equation_closed_from_evidence (D : DifferenceEquationPackage)
    (E : DifferenceEquationEvidence D) : DifferenceEquationClosed D := by
  exact And.intro E.linearityClosed (And.intro E.homogeneousClosed E.explicitFormClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse