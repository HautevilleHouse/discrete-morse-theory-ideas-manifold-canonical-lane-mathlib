import canonicalLaneMathlib.AdmissibleClass
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.MorseHandleDecomposition

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure DiscreteMorseCobordism {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (fM : DiscreteMorseFunction M) (fN : DiscreteMorseFunction N)
    (CM : MorseComplex fM) (CN : MorseComplex fN)
    (HM : MorseHandleDecomposition fM CM) (HN : MorseHandleDecomposition fN CN) where
  cobordismManifold : Type v
  cobordismTopology : TopologicalSpace cobordismManifold
  morseFunctionOnCobordism : DiscreteMorseFunction cobordismManifold
  cobordismMorseHomology : Prop
  cobordismAttachesHandleDecompositions : Prop
  cobordismMorseHomologyClosed : cobordismMorseHomology
  cobordismAttachesHandleDecompositionsClosed : cobordismAttachesHandleDecompositions

structure DiscreteMorseCobordismEvidence {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    {fM : DiscreteMorseFunction M} {fN : DiscreteMorseFunction N}
    {CM : MorseComplex fM} {CN : MorseComplex fN}
    {HM : MorseHandleDecomposition fM CM} {HN : MorseHandleDecomposition fN CN}
    (W : DiscreteMorseCobordism fM fN CM CN HM HN) where
  cobordismMorseHomologyClosed : W.cobordismMorseHomology
  cobordismAttachesHandleDecompositionsClosed : W.cobordismAttachesHandleDecompositions

def DiscreteMorseCobordismClosed {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    {fM : DiscreteMorseFunction M} {fN : DiscreteMorseFunction N}
    {CM : MorseComplex fM} {CN : MorseComplex fN}
    {HM : MorseHandleDecomposition fM CM} {HN : MorseHandleDecomposition fN CN}
    (W : DiscreteMorseCobordism fM fN CM CN HM HN) : Prop :=
  W.cobordismMorseHomology ∧ W.cobordismAttachesHandleDecompositions

theorem discrete_morse_cobordism_closed_from_evidence {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    {fM : DiscreteMorseFunction M} {fN : DiscreteMorseFunction N}
    {CM : MorseComplex fM} {CN : MorseComplex fN}
    {HM : MorseHandleDecomposition fM CM} {HN : MorseHandleDecomposition fN CN}
    (W : DiscreteMorseCobordism fM fN CM CN HM HN)
    (E : DiscreteMorseCobordismEvidence W) : DiscreteMorseCobordismClosed W := by
  exact And.intro E.cobordismMorseHomologyClosed E.cobordismAttachesHandleDecompositionsClosed

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse