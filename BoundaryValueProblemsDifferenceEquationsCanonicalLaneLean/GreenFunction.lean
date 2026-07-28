import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure GreenFunctionPackage where
  kernel : Type
  existence : Prop
  symmetry : Prop
  positivity : Prop

structure GreenFunctionEvidence (G : GreenFunctionPackage) where
  existenceClosed : G.existence
  symmetryClosed : G.symmetry
  positivityClosed : G.positivity

def GreenFunctionClosed (G : GreenFunctionPackage) : Prop :=
  G.existence ∧ G.symmetry ∧ G.positivity

theorem green_function_closed_from_evidence (G : GreenFunctionPackage) (E : GreenFunctionEvidence G) :
    GreenFunctionClosed G := by
  exact And.intro E.existenceClosed (And.intro E.symmetryClosed E.positivityClosed)

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse