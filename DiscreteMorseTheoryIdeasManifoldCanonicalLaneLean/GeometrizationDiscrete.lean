import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean.SurgeryDiscrete

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure GeometrizationDiscretePackage {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    {D : DiscreteRicciFlowPackage C F}
    {S : SurgeryDiscretePackage C F D} where
  finiteDecomposition : Prop
  primeDecompositionCellular : Prop
  sphericalPieceDetected : Prop
  simplyConnectedCaseForcesSphere : Prop

structure GeometrizationDiscreteEvidence {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    {D : DiscreteRicciFlowPackage C F}
    {S : SurgeryDiscretePackage C F D}
    (G : GeometrizationDiscretePackage C F D S) where
  finiteDecompositionClosed : G.finiteDecomposition
  primeDecompositionCellularClosed : G.primeDecompositionCellular
  sphericalPieceDetectedClosed : G.sphericalPieceDetected
  simplyConnectedCaseForcesSphereClosed : G.simplyConnectedCaseForcesSphere

def GeometrizationDiscreteClosed {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    {D : DiscreteRicciFlowPackage C F}
    {S : SurgeryDiscretePackage C F D}
    (G : GeometrizationDiscretePackage C F D S) : Prop :=
  G.finiteDecomposition ∧ G.primeDecompositionCellular ∧
  G.sphericalPieceDetected ∧ G.simplyConnectedCaseForcesSphere

theorem geometrization_discrete_closed_from_evidence {C : DiscreteMorseComplex}
    {F : FormanRicciCurvaturePackage C}
    {D : DiscreteRicciFlowPackage C F}
    {S : SurgeryDiscretePackage C F D}
    (G : GeometrizationDiscretePackage C F D S)
    (E : GeometrizationDiscreteEvidence G) : GeometrizationDiscreteClosed G := by
  exact And.intro E.finiteDecompositionClosed
    (And.intro E.primeDecompositionCellularClosed
      (And.intro E.sphericalPieceDetectedClosed
        E.simplyConnectedCaseForcesSphereClosed))

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse