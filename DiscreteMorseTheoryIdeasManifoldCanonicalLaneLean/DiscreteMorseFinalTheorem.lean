import canonicalLaneMathlib.AdmissibleClass
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.DiscreteMorseComplex
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.BridgeLemmas
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

def ConstrainedDiscreteMorseClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_discrete_morse_endgame (A : AdmissibleClass) :
    ConstrainedDiscreteMorseClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse