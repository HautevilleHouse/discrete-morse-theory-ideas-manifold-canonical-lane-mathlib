import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure DiscreteMorseComplex (X : Type u) where
  carrier : X
  cellDecomposition : Prop
  morseFunction : Prop
  gradientVectorField : Prop
  morseComplex : Prop
  morseDifferential : Prop
  morseHomology : Prop

structure DiscreteMorseEvidence (X : Type u) (M : DiscreteMorseComplex X) where
  cellDecompositionClosed : M.cellDecomposition
  morseFunctionClosed : M.morseFunction
  gradientVectorFieldClosed : M.gradientVectorField
  morseComplexClosed : M.morseComplex
  morseDifferentialClosed : M.morseDifferential
  morseHomologyClosed : M.morseHomology

def DiscreteMorseClosed (X : Type u) (M : DiscreteMorseComplex X) : Prop :=
  M.cellDecomposition ∧ M.morseFunction ∧ M.gradientVectorField ∧
  M.morseComplex ∧ M.morseDifferential ∧ M.morseHomology

theorem discrete_morse_closed_from_evidence (X : Type u) (M : DiscreteMorseComplex X)
    (E : DiscreteMorseEvidence X M) : DiscreteMorseClosed X M := by
  exact And.intro E.cellDecompositionClosed
    (And.intro E.morseFunctionClosed
      (And.intro E.gradientVectorFieldClosed
        (And.intro E.morseComplexClosed
          (And.intro E.morseDifferentialClosed E.morseHomologyClosed))))

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse