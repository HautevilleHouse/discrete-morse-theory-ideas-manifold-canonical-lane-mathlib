import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean

structure DiscreteMorseTheoryEvidenceTerms where
  complexEvidence : DiscreteMorseComplexEvidence
  collapseEvidence : CollapseGeometryEvidence
  homologyEvidence : MorseHomologyEvidence
  inequalitiesEvidence : MorseInequalitiesEvidence
  complexClosed : DiscreteMorseComplexClosed
  collapseClosed : CollapseGeometryClosed
  homologyClosed : MorseHomologyClosed
  inequalitiesClosed : MorseInequalitiesClosed

def DiscreteMorseTheoryEvidenceTerms.fromPackages
    (D : DiscreteMorseComplexPackage) (DE : DiscreteMorseComplexEvidence D)
    (C : CollapseGeometryPackage) (CE : CollapseGeometryEvidence C)
    (M : MorseHomologyPackage) (ME : MorseHomologyEvidence M)
    (I : MorseInequalitiesPackage) (IE : MorseInequalitiesEvidence I) :
    DiscreteMorseTheoryEvidenceTerms :=
  { complexEvidence := DE
    collapseEvidence := CE
    homologyEvidence := ME
    inequalitiesEvidence := IE
    complexClosed := discrete_morse_complex_closed_from_evidence D DE
    collapseClosed := collapse_geometry_closed_from_evidence C CE
    homologyClosed := morse_homology_closed_from_evidence M ME
    inequalitiesClosed := morse_inequalities_closed_from_evidence I IE
  }

end DiscreteMorseTheoryIdeasManifoldCanonicalLaneLean
end HautevilleHouse