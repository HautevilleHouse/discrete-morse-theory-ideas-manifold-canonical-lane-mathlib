import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.ReebGraph

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure MorseHomologyPackage {C : DiscreteMorseComplexPackage}
    {H : HandleDecompositionPackage C} {R : ReebGraphPackage H} where
  homologyComputed : Prop
  invariantUnderHomotopy : Prop
  poincareDualityDerived : Prop

structure MorseHomologyEvidence {C : DiscreteMorseComplexPackage}
    {H : HandleDecompositionPackage C} {R : ReebGraphPackage H}
    (M : MorseHomologyPackage R) where
  homologyComputedClosed : M.homologyComputed
  invariantUnderHomotopyClosed : M.invariantUnderHomotopy
  poincareDualityDerivedClosed : M.poincareDualityDerived

def MorseHomologyClosed {C : DiscreteMorseComplexPackage}
    {H : HandleDecompositionPackage C} {R : ReebGraphPackage H}
    (M : MorseHomologyPackage R) : Prop :=
  M.homologyComputed ∧ M.invariantUnderHomotopy ∧ M.poincareDualityDerived

theorem morse_homology_closed_from_evidence {C : DiscreteMorseComplexPackage}
    {H : HandleDecompositionPackage C} {R : ReebGraphPackage H}
    (M : MorseHomologyPackage R) (E : MorseHomologyEvidence M) :
    MorseHomologyClosed M := by
  exact And.intro E.homologyComputedClosed
    (And.intro E.invariantUnderHomotopyClosed E.poincareDualityDerivedClosed)

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse