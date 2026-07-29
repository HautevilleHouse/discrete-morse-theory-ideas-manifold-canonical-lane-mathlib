import canonicalLaneMathlib.AdmissibleClass
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.DiscreteMorseComplex
import DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.CellularSheaf

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure MorseHomologyPackage (X : Type u) (M : DiscreteMorseComplex X)
    (S : CellularSheaf X) where
  chainComplex : Prop
  homologyGroups : Prop
  morseInequalities : Prop
  cupProduct : Prop

structure MorseHomologyEvidence (X : Type u) (M : DiscreteMorseComplex X)
    (S : CellularSheaf X) (H : MorseHomologyPackage X M S) where
  chainComplexClosed : H.chainComplex
  homologyGroupsClosed : H.homologyGroups
  morseInequalitiesClosed : H.morseInequalities
  cupProductClosed : H.cupProduct

def MorseHomologyClosed (X : Type u) (M : DiscreteMorseComplex X)
    (S : CellularSheaf X) (H : MorseHomologyPackage X M S) : Prop :=
  H.chainComplex ∧ H.homologyGroups ∧ H.morseInequalities ∧ H.cupProduct

theorem morse_homology_closed_from_evidence (X : Type u) (M : DiscreteMorseComplex X)
    (S : CellularSheaf X) (H : MorseHomologyPackage X M S)
    (E : MorseHomologyEvidence X M S H) : MorseHomologyClosed X M S H := by
  exact And.intro E.chainComplexClosed
    (And.intro E.homologyGroupsClosed
      (And.intro E.morseInequalitiesClosed E.cupProductClosed))

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse