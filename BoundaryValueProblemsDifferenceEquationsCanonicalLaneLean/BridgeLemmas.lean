import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

def BVPWitnessClosed (O : BVPAdmittedObject) : Prop :=
  O.existenceAndUniqueness

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BVPWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse