import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure CellularSheaf (X : Type u) where
  baseSpace : X
  cellComplex : Prop
  sheafAssignment : Prop
  stalkData : Prop
  restrictionMaps : Prop
  sheafCondition : Prop

structure CellularSheafEvidence (X : Type u) (S : CellularSheaf X) where
  cellComplexClosed : S.cellComplex
  sheafAssignmentClosed : S.sheafAssignment
  stalkDataClosed : S.stalkData
  restrictionMapsClosed : S.restrictionMaps
  sheafConditionClosed : S.sheafCondition

def CellularSheafClosed (X : Type u) (S : CellularSheaf X) : Prop :=
  S.cellComplex ∧ S.sheafAssignment ∧ S.stalkData ∧
  S.restrictionMaps ∧ S.sheafCondition

theorem cellular_sheaf_closed_from_evidence (X : Type u) (S : CellularSheaf X)
    (E : CellularSheafEvidence X S) : CellularSheafClosed X S := by
  exact And.intro E.cellComplexClosed
    (And.intro E.sheafAssignmentClosed
      (And.intro E.stalkDataClosed
        (And.intro E.restrictionMapsClosed E.sheafConditionClosed)))

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse