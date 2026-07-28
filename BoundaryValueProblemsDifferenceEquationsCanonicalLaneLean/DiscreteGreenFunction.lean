import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BVPDifferenceEquationsCanonicalLaneLean

structure DiscreteGreenFunction where
  operator : SturmLiouvilleDifferenceOperator
  boundary : BoundaryConditionSpace
  kernelFunction : ℕ → ℕ → ℝ
  kernelSymmetry : ∀ i j, kernelFunction i j = kernelFunction j i
  kernelDefiniteness : ∀ i, kernelFunction i i > 0

def DiscreteGreenClosed (g : DiscreteGreenFunction) : Prop :=
  g.kernelSymmetry ∧ g.kernelDefiniteness

end BVPDifferenceEquationsCanonicalLaneLean
end HautevilleHouse