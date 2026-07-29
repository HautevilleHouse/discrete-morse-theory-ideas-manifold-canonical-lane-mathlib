import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure CollapseGeometryPackage where
  admissibleCollapse : Prop
  homologyPreservation : Prop
  homotopyEquivalence : Prop
  collapseReductionSequence : Prop

structure CollapseGeometryEvidence (C : CollapseGeometryPackage) where
  admissibleCollapseClosed : C.admissibleCollapse
  homologyPreservationClosed : C.homologyPreservation
  homotopyEquivalenceClosed : C.homotopyEquivalence

def CollapseGeometryClosed (C : CollapseGeometryPackage) : Prop :=
  C.admissibleCollapse ∧ C.homologyPreservation ∧ C.homotopyEquivalence

theorem collapse_geometry_closed_from_evidence
    (C : CollapseGeometryPackage) (E : CollapseGeometryEvidence C) :
    CollapseGeometryClosed C := by
  exact And.intro E.admissibleCollapseClosed
    (And.intro E.homologyPreservationClosed E.homotopyEquivalenceClosed)

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse