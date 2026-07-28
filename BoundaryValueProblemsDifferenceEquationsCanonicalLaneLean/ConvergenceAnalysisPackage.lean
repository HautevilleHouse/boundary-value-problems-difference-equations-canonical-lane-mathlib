import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.DifferenceEquationPackage
import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.BoundaryConditionPackage
import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.SolutionSpacePackage

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure ConvergenceAnalysisPackage {D : DifferenceEquationPackage}
    {B : BoundaryConditionPackage D} {S : SolutionSpacePackage D B} where
  numericalScheme : Type
  consistencyOrder : ℕ
  stability : Prop
  convergence : Prop
  errorEstimate : ℝ

structure ConvergenceAnalysisEvidence {D : DifferenceEquationPackage}
    {B : BoundaryConditionPackage D} {S : SolutionSpacePackage D B}
    (C : ConvergenceAnalysisPackage D B S) where
  numericalSchemeClosed : C.numericalScheme = C.numericalScheme
  consistencyOrderClosed : C.consistencyOrder = C.consistencyOrder
  stabilityClosed : C.stability
  convergenceClosed : C.convergence
  errorEstimateClosed : C.errorEstimate = C.errorEstimate

def ConvergenceAnalysisClosed {D : DifferenceEquationPackage}
    {B : BoundaryConditionPackage D} {S : SolutionSpacePackage D B}
    (C : ConvergenceAnalysisPackage D B S) : Prop :=
  C.stability ∧ C.convergence

theorem convergence_analysis_closed_from_evidence {D : DifferenceEquationPackage}
    {B : BoundaryConditionPackage D} {S : SolutionSpacePackage D B}
    (C : ConvergenceAnalysisPackage D B S) (E : ConvergenceAnalysisEvidence C) :
    ConvergenceAnalysisClosed C := by
  exact And.intro E.stabilityClosed E.convergenceClosed

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse