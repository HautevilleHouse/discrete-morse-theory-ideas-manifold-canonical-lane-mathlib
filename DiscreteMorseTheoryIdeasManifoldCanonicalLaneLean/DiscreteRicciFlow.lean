import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.FormanRicciCurvature

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure DiscreteRicciFlowPackage {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C} where
  timeParameter : Type u
  metricEvolution : Type v
  flowEquation : Prop
  shortTimeExistence : Prop
  longTimeBehaviour : Prop

structure DiscreteRicciFlowEvidence {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    (D : DiscreteRicciFlowPackage C F) where
  flowEquationClosed : D.flowEquation
  shortTimeExistenceClosed : D.shortTimeExistence
  longTimeBehaviourClosed : D.longTimeBehaviour

def DiscreteRicciFlowClosed {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    (D : DiscreteRicciFlowPackage C F) : Prop :=
  D.flowEquation ∧ D.shortTimeExistence ∧ D.longTimeBehaviour

theorem discrete_ricci_flow_closed_from_evidence {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    (D : DiscreteRicciFlowPackage C F)
    (E : DiscreteRicciFlowEvidence D) : DiscreteRicciFlowClosed D := by
  exact And.intro E.flowEquationClosed
    (And.intro E.shortTimeExistenceClosed E.longTimeBehaviourClosed)

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse