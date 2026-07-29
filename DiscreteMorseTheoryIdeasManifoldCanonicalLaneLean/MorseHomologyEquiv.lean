import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.DiscreteMorseTheoryIdeasManifold

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure MorseHomologyEquivPackage {C : DiscreteMorseComplex} where
  cellularHomologyType : Type u
  singularHomologyType : Type v
  isomorphismExists : Prop
  isomorphismNatural : Prop
  supportsPoincareDuality : Prop

structure MorseHomologyEquivEvidence {C : DiscreteMorseComplex}
    (M : MorseHomologyEquivPackage C) where
  isomorphismExistsClosed : M.isomorphismExists
  isomorphismNaturalClosed : M.isomorphismNatural
  supportsPoincareDualityClosed : M.supportsPoincareDuality

def MorseHomologyEquivClosed {C : DiscreteMorseComplex}
    (M : MorseHomologyEquivPackage C) : Prop :=
  M.isomorphismExists ∧ M.isomorphismNatural ∧ M.supportsPoincareDuality

theorem morse_homology_equiv_closed_from_evidence {C : DiscreteMorseComplex}
    (M : MorseHomologyEquivPackage C)
    (E : MorseHomologyEquivEvidence M) : MorseHomologyEquivClosed M := by
  exact And.intro E.isomorphismExistsClosed
    (And.intro E.isomorphismNaturalClosed E.supportsPoincareDualityClosed)

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse