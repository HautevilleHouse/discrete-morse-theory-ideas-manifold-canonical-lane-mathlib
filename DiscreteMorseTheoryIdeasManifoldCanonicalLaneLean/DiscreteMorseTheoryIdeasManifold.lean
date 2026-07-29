import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure DiscreteMorseSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  dimension : ℕ
  dimensionTerm : dimension = 3

structure DiscreteMorseComplex where
  space : DiscreteMorseSpace
  criticalCells : Set (ℕ × ℕ)  -- dimension x index
  morseFunction : carrier → ℝ
  gradientFlow : carrier → carrier
  stableManifoldCellular : Prop
  unstableManifoldCellular : Prop
  morseInequalitiesHold : Prop
  complexAcyclic : Prop

structure DiscreteMorseEvidence (C : DiscreteMorseComplex) where
  stableManifoldCellularClosed : C.stableManifoldCellular
  unstableManifoldCellularClosed : C.unstableManifoldCellular
  morseInequalitiesHoldClosed : C.morseInequalitiesHold
  complexAcyclicClosed : C.complexAcyclic

def DiscreteMorseClosed (C : DiscreteMorseComplex) : Prop :=
  C.stableManifoldCellular ∧ C.unstableManifoldCellular ∧
  C.morseInequalitiesHold ∧ C.complexAcyclic

theorem discrete_morse_closed_from_evidence (C : DiscreteMorseComplex)
    (E : DiscreteMorseEvidence C) : DiscreteMorseClosed C := by
  exact And.intro E.stableManifoldCellularClosed
    (And.intro E.unstableManifoldCellularClosed
      (And.intro E.morseInequalitiesHoldClosed E.complexAcyclicClosed))

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse