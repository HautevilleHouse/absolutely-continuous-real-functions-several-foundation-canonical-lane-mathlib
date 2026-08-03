import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsolutelyContinuousRealFunctionsSeveralFoundationCanonicalLaneLean

structure AbsolutelyContinuousRealFunction where
  dimension : ℕ
  toFun : (Fin dimension → ℝ) → ℝ
  absolutelyContinuous : Prop

structure AbsolutelyContinuousAdmittedObject where
  function : AbsolutelyContinuousRealFunction
  lineRestrictionsAbsolutelyContinuous : Prop
  integrablePartialGradients : Prop
  smoothApproximation : Prop

def AbsoluteContinuityWitnessClosed (o : AbsolutelyContinuousAdmittedObject) : Prop :=
  o.function.absolutelyContinuous ∧
  o.lineRestrictionsAbsolutelyContinuous ∧
  o.integrablePartialGradients ∧
  o.smoothApproximation

structure AdmissibleClass where
  object : AbsolutelyContinuousAdmittedObject
  bridgeWitness : AbsoluteContinuityWitnessClosed object
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AbsoluteContinuityWitnessClosed A.object

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.bridgeWitness

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

theorem constrained_theorem_closure (A : AdmissibleClass) : ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

theorem admittedClosure_iff (A : AdmissibleClass) :
    admittedClosure A ↔ ConstrainedTheoremClosure A := by
  rfl

end AbsolutelyContinuousRealFunctionsSeveralFoundationCanonicalLaneLean
end HautevilleHouse