import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.DiscreteRicciFlow

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure SurgeryDiscretePackage {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    {D : DiscreteRicciFlowPackage C F} where
  surgeryTimesDiscrete : Prop
  surgeryRegionCellular : Prop
  postSurgeryComplexControlled : Prop
  flowContinuesAfterSurgery : Prop

structure SurgeryDiscreteEvidence {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    {D : DiscreteRicciFlowPackage C F}
    (S : SurgeryDiscretePackage C F D) where
  surgeryTimesDiscreteClosed : S.surgeryTimesDiscrete
  surgeryRegionCellularClosed : S.surgeryRegionCellular
  postSurgeryComplexControlledClosed : S.postSurgeryComplexControlled
  flowContinuesAfterSurgeryClosed : S.flowContinuesAfterSurgery

def SurgeryDiscreteClosed {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    {D : DiscreteRicciFlowPackage C F}
    (S : SurgeryDiscretePackage C F D) : Prop :=
  S.surgeryTimesDiscrete ∧ S.surgeryRegionCellular ∧
  S.postSurgeryComplexControlled ∧ S.flowContinuesAfterSurgery

theorem surgery_discrete_closed_from_evidence {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    {D : DiscreteRicciFlowPackage C F}
    (S : SurgeryDiscretePackage C F D)
    (E : SurgeryDiscreteEvidence S) : SurgeryDiscreteClosed S := by
  exact And.intro E.surgeryTimesDiscreteClosed
    (And.intro E.surgeryRegionCellularClosed
      (And.intro E.postSurgeryComplexControlledClosed
        E.flowContinuesAfterSurgeryClosed))

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse