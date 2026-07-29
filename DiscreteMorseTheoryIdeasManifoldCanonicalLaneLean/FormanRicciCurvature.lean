import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure FormanRicciCurvature (X : Type u) where
  cellComplex : X
  weightedGraph : Prop
  ricciCurvatureFormula : Prop
  curvatureBounds : Prop
  laplacianComparison : Prop

structure FormanRicciEvidence (X : Type u) (F : FormanRicciCurvature X) where
  weightedGraphClosed : F.weightedGraph
  ricciCurvatureFormulaClosed : F.ricciCurvatureFormula
  curvatureBoundsClosed : F.curvatureBounds
  laplacianComparisonClosed : F.laplacianComparison

def FormanRicciClosed (X : Type u) (F : FormanRicciCurvature X) : Prop :=
  F.weightedGraph ∧ F.ricciCurvatureFormula ∧ F.curvatureBounds ∧ F.laplacianComparison

theorem forman_ricci_closed_from_evidence (X : Type u) (F : FormanRicciCurvature X)
    (E : FormanRicciEvidence X F) : FormanRicciClosed X F := by
  exact And.intro E.weightedGraphClosed
    (And.intro E.ricciCurvatureFormulaClosed
      (And.intro E.curvatureBoundsClosed E.laplacianComparisonClosed))

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse