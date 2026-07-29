import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.MorseComplex

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure HandleDecompositionPackage {C : DiscreteMorseComplexPackage} where
  handleSlidesDefined : Prop
  gradientVectorFieldDual : Prop
  cancellationPairsChosen : Prop
  morseComplexLeadsToHandleDecomp : C → Prop

structure HandleDecompositionEvidence {C : DiscreteMorseComplexPackage}
    (H : HandleDecompositionPackage C) where
  handleSlidesDefinedClosed : H.handleSlidesDefined
  gradientVectorFieldDualClosed : H.gradientVectorFieldDual
  cancellationPairsChosenClosed : H.cancellationPairsChosen

def HandleDecompositionClosed {C : DiscreteMorseComplexPackage}
    (H : HandleDecompositionPackage C) : Prop :=
  H.handleSlidesDefined ∧ H.gradientVectorFieldDual ∧ H.cancellationPairsChosen

theorem handle_decomposition_closed_from_evidence {C : DiscreteMorseComplexPackage}
    (H : HandleDecompositionPackage C) (E : HandleDecompositionEvidence H) :
    HandleDecompositionClosed H := by
  exact And.intro E.handleSlidesDefinedClosed
    (And.intro E.gradientVectorFieldDualClosed E.cancellationPairsChosenClosed)

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse