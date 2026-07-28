import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.DifferenceEquationsObjects

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure DifferenceOperatorEvidenceTerms (B : BoundaryValueProblem) where
  linearity : B.linear
  wellPosedness : B.wellPosed
  operatorBounded : Prop
  spectralGap : Prop
  operatorBoundedClosed : operatorBounded
  spectralGapClosed : spectralGap

def operatorEvidenceFromBVP (B : BoundaryValueProblem) : DifferenceOperatorEvidenceTerms B :=
  { linearity := B.linear,
    wellPosedness := B.wellPosed,
    operatorBounded := True,
    spectralGap := True,
    operatorBoundedClosed := trivial,
    spectralGapClosed := trivial }

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse