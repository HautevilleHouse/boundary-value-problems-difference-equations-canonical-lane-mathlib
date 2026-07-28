import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BVPDifferenceEquationsCanonicalLaneLean

structure BoundaryConditionSpace where
  leftCondition : ℕ → ℝ
  rightCondition : ℕ → ℝ
  linearity : (leftCondition = fun _ => 0) ∨ (rightCondition = fun _ => 0)

def BoundaryConditionClosed (bc : BoundaryConditionSpace) : Prop :=
  bc.linearity

end BVPDifferenceEquationsCanonicalLaneLean
end HautevilleHouse