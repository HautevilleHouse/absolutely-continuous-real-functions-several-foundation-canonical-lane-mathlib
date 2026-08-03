import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsolutelyContinuousRealFunctionsSeveralFoundationCanonicalLaneLean

/-- The gate-closed condition for the foundational admissible class of absolutely
continuous functions of several variables. The admissible class is gate-closed
when the endpoint condition is satisfied or the carried remainder is recorded. -/
def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

/-- Every admissible class in this foundation is gate-closed by construction. -/
theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end AbsolutelyContinuousRealFunctionsSeveralFoundationCanonicalLaneLean
end HautevilleHouse