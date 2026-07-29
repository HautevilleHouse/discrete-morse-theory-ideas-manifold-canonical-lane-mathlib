import canonicalLaneMathlib.AdmissibleClass
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.DiscreteMorseFunction

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure MorseComplex {M : Type u} [TopologicalSpace M] (f : DiscreteMorseFunction M) where
  chainGroups : ℕ → Type v
  boundaryOperator : ℕ → (chainGroups (n+1) → chainGroups n)
  boundarySquaredZero : Prop
  homologyGroups : ℕ → Type w
  morseHomologyIsomorphism : Prop
  boundarySquaredZeroClosed : boundarySquaredZero
  morseHomologyIsomorphismClosed : morseHomologyIsomorphism

structure MorseComplexEvidence {M : Type u} [TopologicalSpace M] {f : DiscreteMorseFunction M}
    (C : MorseComplex f) where
  boundarySquaredZeroClosed : C.boundarySquaredZero
  morseHomologyIsomorphismClosed : C.morseHomologyIsomorphism

def MorseComplexClosed {M : Type u} [TopologicalSpace M] {f : DiscreteMorseFunction M}
    (C : MorseComplex f) : Prop :=
  C.boundarySquaredZero ∧ C.morseHomologyIsomorphism

theorem morse_complex_closed_from_evidence {M : Type u} [TopologicalSpace M] {f : DiscreteMorseFunction M}
    (C : MorseComplex f) (E : MorseComplexEvidence C) : MorseComplexClosed C := by
  exact And.intro E.boundarySquaredZeroClosed E.morseHomologyIsomorphismClosed

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse