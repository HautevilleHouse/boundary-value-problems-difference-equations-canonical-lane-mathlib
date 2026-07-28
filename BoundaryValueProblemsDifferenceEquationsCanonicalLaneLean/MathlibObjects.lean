import Mathlib.Data.Nat.Basic

namespace HautevilleHouse
namespace BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean

structure BVPDESpace where
  carrier : Type
  vectorSpace : AddCommGroup carrier

structure BVPDEAdmittedObject where
  space : BVPDESpace
  differenceOrder : Nat
  boundaryConditions : Prop
  wellPosed : Prop
  conclusion : wellPosed

end BoundaryValueProblemsDifferenceEquationsCanonicalLaneLean
end HautevilleHouse