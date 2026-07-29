import canonicalLaneMathlib.AdmissibleClass
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.MorseComplex

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure MorseHandleDecomposition {M : Type u} [TopologicalSpace M] (f : DiscreteMorseFunction M)
    (C : MorseComplex f) where
  handleDecomposition : Type v
  indexAttachedHandles : ℕ → handleDecomposition → Prop
  inducingMorseFunction : Prop
  handleDecompositionCompatible : Prop
  inducingMorseFunctionClosed : inducingMorseFunction
  handleDecompositionCompatibleClosed : handleDecompositionCompatible

structure MorseHandleDecompositionEvidence {M : Type u} [TopologicalSpace M] {f : DiscreteMorseFunction M}
    {C : MorseComplex f} (H : MorseHandleDecomposition f C) where
  inducingMorseFunctionClosed : H.inducingMorseFunction
  handleDecompositionCompatibleClosed : H.handleDecompositionCompatible

def MorseHandleDecompositionClosed {M : Type u} [TopologicalSpace M] {f : DiscreteMorseFunction M}
    {C : MorseComplex f} (H : MorseHandleDecomposition f C) : Prop :=
  H.inducingMorseFunction ∧ H.handleDecompositionCompatible

theorem morse_handle_decomposition_closed_from_evidence {M : Type u} [TopologicalSpace M]
    {f : DiscreteMorseFunction M} {C : MorseComplex f} (H : MorseHandleDecomposition f C)
    (E : MorseHandleDecompositionEvidence H) : MorseHandleDecompositionClosed H := by
  exact And.intro E.inducingMorseFunctionClosed E.handleDecompositionCompatibleClosed

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse