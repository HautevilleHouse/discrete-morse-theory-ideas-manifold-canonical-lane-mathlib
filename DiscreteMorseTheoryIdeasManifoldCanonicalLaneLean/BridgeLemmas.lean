import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  DiscreteMorseWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse