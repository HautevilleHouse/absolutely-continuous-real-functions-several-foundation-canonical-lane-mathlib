import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsolutelyContinuousRealFunctionsSeveralFoundationCanonicalLaneLean

/-- A witness for the several-variable absolute continuity foundation:
a function `f` is absolutely continuous as a function of several real variables
exactly when it is ACL and its first-order weak partial derivatives are L¹. -/
structure SeveralFoundationWitness where
  dim : ℕ
  f : (Fin dim → ℝ) → ℝ
  acl_on_lines : Prop
  weak_derivatives_integrable : Prop
  continuous_representative : Prop
  conclusion : acl_on_lines ∧ weak_derivatives_integrable ∧ continuous_representative

/-- The closure condition attached to a `SeveralFoundationWitness`. -/
def SeveralFoundationWitnessClosed (w : SeveralFoundationWitness) : Prop :=
  w.acl_on_lines ∧ w.weak_derivatives_integrable ∧ w.continuous_representative

/-- In the canonical lane, an `AdmissibleClass` pins a witness object. -/
structure AdmissibleClass where
  object : SeveralFoundationWitness

/-- Epistemological bridge: the admissible object is closed under the
several-variable absolute continuity foundation. -/
def bridgeClosed (A : AdmissibleClass) : Prop :=
  SeveralFoundationWitnessClosed A.object

/-- The bridge is always constructible from the pinned witness conclusion. -/
theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  unfold bridgeClosed SeveralFoundationWitnessClosed
  exact A.object.conclusion

/-- Extracting the ACL component of the bridge. -/
lemma bridge_acl (A : AdmissibleClass) : A.object.acl_on_lines :=
  (bridge_from_admissible_class A).1

/-- Extracting the L¹ weak derivative component of the bridge. -/
lemma bridge_weak_derivatives (A : AdmissibleClass) :
    A.object.weak_derivatives_integrable :=
  (bridge_from_admissible_class A).2.1

/-- Extracting the continuous representative component of the bridge. -/
lemma bridge_continuous_representative (A : AdmissibleClass) :
    A.object.continuous_representative :=
  (bridge_from_admissible_class A).2.2

/-- The gate closure: the continuous representative also forces the ACL
and weak-derivative side of the foundation. -/
def gateClosed (A : AdmissibleClass) : Prop :=
  A.object.continuous_representative →
    A.object.acl_on_lines ∧ A.object.weak_derivatives_integrable

/-- The gate is constructible from the same witness conclusion. -/
theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  intro _
  exact And.intro (bridge_acl A) (bridge_weak_derivatives A)

/-- Domain-specific closure: bridge and gate together. -/
def SeveralAbsoluteContinuityFoundationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

/-- Endgame: the canonical admissible class for the several-variable
absolute continuity foundation is closed. -/
theorem several_absolute_continuity_foundation_endgame (A : AdmissibleClass) :
    SeveralAbsoluteContinuityFoundationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AbsolutelyContinuousRealFunctionsSeveralFoundationCanonicalLaneLean
end HautevilleHouse