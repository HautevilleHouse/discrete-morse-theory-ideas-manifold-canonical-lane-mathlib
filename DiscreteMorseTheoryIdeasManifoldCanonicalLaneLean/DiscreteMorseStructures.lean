import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure DiscreteMorseFunction (M : Type) [TopologicalSpace M] where
  criticalPoints : Set M
  index : M → ℕ
  gradientLikeVectorField : Type
  morseChart : M → Type
  morseChartSmooth : Prop
  criticalPointNondegenerate : Prop
  indexFinite : Set.Finite criticalPoints

def DiscreteMorseFunctionClosed {M : Type} [TopologicalSpace M] (f : DiscreteMorseFunction M) : Prop :=
  f.criticalPointNondegenerate

structure DiscreteMorseComplex (M : Type) [TopologicalSpace M] (f : DiscreteMorseFunction M) where
  chainGroups : ℕ → Type
  boundaryMap : (n : ℕ) → f.criticalPoints → f.criticalPoints → ℤ
  boundarySquared : (n : ℕ) → (a b c : f.criticalPoints) → boundaryMap n a b * boundaryMap n b c = 0
  homologyGroups : ℕ → Type

structure DiscreteMorseEvidence (M : Type) [TopologicalSpace M] (f : DiscreteMorseFunction M) (C : DiscreteMorseComplex M f) where
  boundarySquaredClosed : (n : ℕ) → (a b c : f.criticalPoints) → C.boundaryMap n a b * C.boundaryMap n b c = 0

def DiscreteMorseComplexClosed {M : Type} [TopologicalSpace M] {f : DiscreteMorseFunction M} (C : DiscreteMorseComplex M f) : Prop :=
  ∀ (n : ℕ) (a b c : f.criticalPoints), C.boundaryMap n a b * C.boundaryMap n b c = 0

theorem discrete_morse_complex_closed_from_evidence {M : Type} [TopologicalSpace M] {f : DiscreteMorseFunction M} (C : DiscreteMorseComplex M f) (E : DiscreteMorseEvidence M f C) : DiscreteMorseComplexClosed C := by
  intro n a b c
  exact E.boundarySquaredClosed n a b c

end HautevilleHouse
end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
