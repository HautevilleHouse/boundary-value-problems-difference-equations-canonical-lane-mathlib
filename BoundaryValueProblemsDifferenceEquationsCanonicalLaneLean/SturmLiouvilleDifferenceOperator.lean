import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BVPDifferenceEquationsCanonicalLaneLean

structure SturmLiouvilleDifferenceOperator where
  gridSize : ℕ
  coefficients : ℕ → ℝ
  weightFunction : ℕ → ℝ
  symmetry : coefficients = (fun i => coefficients (gridSize - i))
  positivity : ∀ i, coefficients i > 0

def SturmLiouvilleClosed (op : SturmLiouvilleDifferenceOperator) : Prop :=
  op.symmetry ∧ op.positivity

end BVPDifferenceEquationsCanonicalLaneLean
end HautevilleHouse