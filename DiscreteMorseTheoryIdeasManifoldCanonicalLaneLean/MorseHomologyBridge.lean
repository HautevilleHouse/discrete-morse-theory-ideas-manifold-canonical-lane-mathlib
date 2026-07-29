import canonicalLaneMathlib.AdmissibleClass
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.DiscreteMorseStructures

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiscreteMorseFunctionClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end HautevilleHouse
end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
