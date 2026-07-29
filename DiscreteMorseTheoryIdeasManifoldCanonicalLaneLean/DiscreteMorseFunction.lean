import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure DiscreteMorseFunction (M : Type u) [TopologicalSpace M] where
  criticalPoints : Set M
  index : M → ℕ
  gradientLikeVectorField : Type v
  morseInequalities : Prop
  handleAttachmentData : Prop
  morseInequalitiesClosed : morseInequalities
  handleAttachmentDataClosed : handleAttachmentData

structure DiscreteMorseEvidence {M : Type u} [TopologicalSpace M] (f : DiscreteMorseFunction M) where
  morseInequalitiesClosed : f.morseInequalities
  handleAttachmentDataClosed : f.handleAttachmentData

def DiscreteMorseClosed {M : Type u} [TopologicalSpace M] (f : DiscreteMorseFunction M) : Prop :=
  f.morseInequalities ∧ f.handleAttachmentData

theorem discrete_morse_closed_from_evidence {M : Type u} [TopologicalSpace M] (f : DiscreteMorseFunction M)
    (E : DiscreteMorseEvidence f) : DiscreteMorseClosed f := by
  exact And.intro E.morseInequalitiesClosed E.handleAttachmentDataClosed

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse