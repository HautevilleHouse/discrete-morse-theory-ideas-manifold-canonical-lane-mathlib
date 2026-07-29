import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure DiscreteMorseAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  closedSmoothManifold : Prop
  morseFunction : space → ℝ
  morseCriticalPoints : Prop
  gradientLikeVectorFieldGiven : Prop
  conclusion : morseCriticalPoints

structure AdmissibleClass where
  object : DiscreteMorseAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DiscreteMorseWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse