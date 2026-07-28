import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure DiscreteNondegeneracyPackage where
  gridRegularity : Prop
  operatorEllipticity : Prop
  boundaryConditionCompatibility : Prop
  stabilityMargin : Prop

structure DiscreteNondegeneracyEvidence (N : DiscreteNondegeneracyPackage) where
  gridRegularityClosed : N.gridRegularity
  operatorEllipticityClosed : N.operatorEllipticity
  boundaryConditionCompatibilityClosed : N.boundaryConditionCompatibility
  stabilityMarginClosed : N.stabilityMargin

def DiscreteNondegeneracyClosed (N : DiscreteNondegeneracyPackage) : Prop :=
  N.gridRegularity ∧ N.operatorEllipticity ∧ N.boundaryConditionCompatibility ∧ N.stabilityMargin

theorem discrete_nondegeneracy_closed_from_evidence
    (N : DiscreteNondegeneracyPackage) (E : DiscreteNondegeneracyEvidence N) :
    DiscreteNondegeneracyClosed N := by
  exact And.intro E.gridRegularityClosed
    (And.intro E.operatorEllipticityClosed
      (And.intro E.boundaryConditionCompatibilityClosed E.stabilityMarginClosed))

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse