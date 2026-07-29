import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure MorseInequalitiesPackage where
  weakMorseInequalities : Prop
  strongMorseInequalities : Prop
  bettiNumberBounds : Prop
  eulerCharacteristicIdentity : Prop

structure MorseInequalitiesEvidence (M : MorseInequalitiesPackage) where
  weakMorseInequalitiesClosed : M.weakMorseInequalities
  strongMorseInequalitiesClosed : M.strongMorseInequalities
  eulerCharacteristicIdentityClosed : M.eulerCharacteristicIdentity

def MorseInequalitiesClosed (M : MorseInequalitiesPackage) : Prop :=
  M.weakMorseInequalities ∧ M.strongMorseInequalities ∧ M.eulerCharacteristicIdentity

theorem morse_inequalities_closed_from_evidence
    (M : MorseInequalitiesPackage) (E : MorseInequalitiesEvidence M) :
    MorseInequalitiesClosed M := by
  exact And.intro E.weakMorseInequalitiesClosed
    (And.intro E.strongMorseInequalitiesClosed E.eulerCharacteristicIdentityClosed)

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse