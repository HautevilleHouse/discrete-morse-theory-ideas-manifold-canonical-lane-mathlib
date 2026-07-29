import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.HandleDecomposition

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure ReebGraphPackage {C : DiscreteMorseComplexPackage}
    {H : HandleDecompositionPackage C} where
  levelSetsClassified : Prop
  reebGraphConstructed : Prop
  connectivityRecovered : Prop
  topologicalInvariant : Prop

structure ReebGraphEvidence {C : DiscreteMorseComplexPackage}
    {H : HandleDecompositionPackage C} (R : ReebGraphPackage H) where
  levelSetsClassifiedClosed : R.levelSetsClassified
  reebGraphConstructedClosed : R.reebGraphConstructed
  connectivityRecoveredClosed : R.connectivityRecovered
  topologicalInvariantClosed : R.topologicalInvariant

def ReebGraphClosed {C : DiscreteMorseComplexPackage}
    {H : HandleDecompositionPackage C} (R : ReebGraphPackage H) : Prop :=
  R.levelSetsClassified ∧ R.reebGraphConstructed ∧
  R.connectivityRecovered ∧ R.topologicalInvariant

theorem reeb_graph_closed_from_evidence {C : DiscreteMorseComplexPackage}
    {H : HandleDecompositionPackage C} (R : ReebGraphPackage H)
    (E : ReebGraphEvidence R) : ReebGraphClosed R := by
  exact And.intro E.levelSetsClassifiedClosed
    (And.intro E.reebGraphConstructedClosed
      (And.intro E.connectivityRecoveredClosed E.topologicalInvariantClosed))

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse