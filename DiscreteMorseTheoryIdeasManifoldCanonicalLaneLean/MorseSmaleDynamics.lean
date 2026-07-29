import canonicalLaneMathlib.AdmissibleClass
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.HandleDecomposition

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure MorseSmaleDynamicsPackage (M : Type) [TopologicalSpace M] (f : DiscreteMorseFunction M) where
  stableManifolds : (x : f.criticalPoints) → Set M
  unstableManifolds : (x : f.criticalPoints) → Set M
  transverseIntersection : ∀ x y : f.criticalPoints, stableManifolds x ∩ unstableManifolds y ≠ ∅ → stableManifolds x ⋔ unstableManifolds y
  gradientFlow : Type
  flowDefined : Prop

structure MorseSmaleDynamicsEvidence (M : Type) [TopologicalSpace M] (f : DiscreteMorseFunction M) (P : MorseSmaleDynamicsPackage M f) where
  transverseIntersectionClosed : ∀ x y : f.criticalPoints, P.stableManifolds x ∩ P.unstableManifolds y ≠ ∅ → P.stableManifolds x ⋔ P.unstableManifolds y

def MorseSmaleDynamicsClosed {M : Type} [TopologicalSpace M] {f : DiscreteMorseFunction M} (P : MorseSmaleDynamicsPackage M f) : Prop :=
  ∀ x y : f.criticalPoints, P.stableManifolds x ∩ P.unstableManifolds y ≠ ∅ → P.stableManifolds x ⋔ P.unstableManifolds y

theorem morse_smale_dynamics_closed_from_evidence {M : Type} [TopologicalSpace M] {f : DiscreteMorseFunction M} (P : MorseSmaleDynamicsPackage M f) (E : MorseSmaleDynamicsEvidence M f P) : MorseSmaleDynamicsClosed P := by
  intro x y h
  exact E.transverseIntersectionClosed x y h

end HautevilleHouse
end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
